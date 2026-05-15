Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82451CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvnRTx0f4vw3sJsD7OJ+oVnskW5pC2F3Sp8EdeNV/hg=; b=abMT1ODNmj9YjU
	59gOOA23rGXdSPYsBceQ6t56ipA40QVWx6lS3+/K9tF1j0UQy3iuft/OLb6eNXeY2pgbSYuGzO2Hn
	4LFD4taE3GDuIX4+kHxE3ZZ4MzSlLYf8xokQxyx5TB0iBZd8q+H57zlIBtDFIYI6G1ayIDN6BfSn9
	SiAGTiv8dU4Bo8VSsBzkr2TaDAanphtPl4O6DyXNkd46uWgNa1/YJplro8gRkw2NfqXMNwgu3CzMO
	DwJn6cRWPYbjpt6GTtk7KYe3cEBgSrvMO/OOoIWLMbHvuXysacio1CNE8Zwi3PMFNw4w7kwkk5CDq
	BN3O8U8WyIAS0vWde8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNy1H-00000009Bxc-0s49;
	Fri, 15 May 2026 19:16:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNy1E-00000009Bws-0qw4
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 19:16:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891b0786beso1113985e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778872578; x=1779477378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LnYbJwS1H257uWrNX2t9Fc9WjDdmWNsOdHa8UwPeew=;
        b=DkRdpaR/jayT2F5M/BP1tnHlvu1BPFnTNORussi5Acr1l1ZPf80JZXp/xNstRYw+co
         5Z14plZ11IvSU8dxECqiiRkf9Ey3T6euLH4FMDOPqKlFZ0F6ToVw7jgfvalzrZdnuKXI
         9IacEZ6AswJwf3vQl9UzWpwOFmV8DYuRSJPVEwIP6Gkou01XDPuKvVsI44rsAIcqFJfi
         Vp1Sd8RPtIvqZu40k8fwuG50BuIBTb1c0ALjple/lKB+Cf4NfTdc8p7nKvHV9oaRaw8I
         inUZDh4xpv1yU0yl+VUspY6D42ETvp0EeGxFFQ92mncPeEaI+ryiU+z0hYkukf2gZgKc
         incQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872578; x=1779477378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LnYbJwS1H257uWrNX2t9Fc9WjDdmWNsOdHa8UwPeew=;
        b=V1DrADrrcbk5udEL/IpwPlQg5+NnbmMKDIgKR5oLwUcVNsxjtlMgpvTjLvxSlDnt+i
         r02qVc2VeqyxfEqM7fYXmR9tYkMWkLocTPScMm7N0G3esKoZXwRLc3eJE/w54fLu1qRC
         FA+qloBqgLLYNGd/RHIH8C4zG5QJ2JFUiWObuN3pybNQegpISSsG1v++VbMIDneMSLzV
         jko3BWxV8FDBup9DlffciYSNwhK+5rhLiDB8okuIMwYKhyQcBTHp8h6nXTrtbFx/zT4+
         N/wYQgw8ZuM4mNQOyxdlAD70Pm6/rsXZEf//bYQokXi6UdYHpU5alOXbpcs51dhS4LL9
         P21w==
X-Forwarded-Encrypted: i=1; AFNElJ85ByzW+bFpNJp9d6MzK8k+6j6onYlA3j3wyemF3lKTO92zD6z4z9sQPMZvRlvaoy5GZyTyd2bk/zIbGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzch2huNiMaJTYrkAXFKPzt0/dOx4pfEzxU1qQo6re9xRQBcIJb
	AHjddUprybh6FouUbJ/95D7l9C9bf6nnIXZMG5NQnyliRyKCIEDifgf8TfJnVkBE
X-Gm-Gg: Acq92OHHwoqahhwMGHD/aypFcF1Xqr89uVRae71TX8O46zOYo86zIuKFSn5SXdZkMtf
	RIAl5z0MJLAjijKEqQ6Jtt/kyRLy04/FZhva4iRztaFhQiqBXejNGSCUE/M1JS79hEVHKWZkGJg
	LLvzNM6SwO6zz2z+xqeJ4pUJxWIHU4r3ccmr2PIB2Ig+nPjLvxpe37zO7W2oymjV9wCOqUgJqEV
	9cE5TV423jOp1jgAKv54hLWCGuQEqgpcWL5K6KAvF8AOTmADT/hxtNlmuTNqy7EdKQvViKFIEAk
	g7Cy71PRekd89STsygkSkaVNlWux+6gC74YFZvSp5SyGU2om5piTx/Jv6W42Gnwr8+GqD58kOCP
	6IZCoeKTyCwLYry4dXwTbzDmUe7J6dB/rdEJEnTNfHmbUeS6UFkwasDScg00WXweOdTv2JeHbTw
	B0rveso280AtnfVzKSP6eFxrcUzGgVnwLx9X45BbwqfpjKU02Cjwn03x5lgkwAzrIOkvf2V/o=
X-Received: by 2002:a05:600c:c087:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48fe60de6a7mr63536195e9.3.1778872578055;
        Fri, 15 May 2026 12:16:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm20016505e9.19.2026.05.15.12.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 12:16:17 -0700 (PDT)
Date: Fri, 15 May 2026 20:16:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB
 to 2GB
Message-ID: <20260515201613.243ea49b@pumpkin>
In-Reply-To: <CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
References: <20260514075036.1432352-1-zong.li@sifive.com>
	<20260514095605.2c7d8761@pumpkin>
	<CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
	<20260515102411.4d3e868a@pumpkin>
	<CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_121620_296865_156BD33F 
X-CRM114-Status: GOOD (  30.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNSBNYXkgMjAyNiAyMjoyOTowNSArMDgwMApab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgoKPiBPbiBGcmksIE1heSAxNSwgMjAyNiBhdCA1OjI04oCvUE0gRGF2aWQg
TGFpZ2h0Cj4gPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9u
IEZyaSwgMTUgTWF5IDIwMjYgMTE6NDI6NDUgKzA4MDAKPiA+IFpvbmcgTGkgPHpvbmcubGlAc2lm
aXZlLmNvbT4gd3JvdGU6Cj4gPiAgCj4gPiA+IE9uIFRodSwgTWF5IDE0LCAyMDI2IGF0IDQ6NTbi
gK9QTSBEYXZpZCBMYWlnaHQgIAo+ID4gLi4gIAo+ID4gPiA+IEkgYWxzbyBkb24ndCB1bmRlcnN0
YW5kIHRoZSByYXRpb25hbCBmb3IganVzdCAvMiBhbmQgdGhlIDJHIHVwcGVyIGxpbWl0Lgo+ID4g
PiA+IFlvdSBuZWVkIDUxMiBuZXN0ZWQgZnVuY3Rpb24gY2FsbHMgdG8gZXZlbiB1c2UgNGsuCj4g
PiA+ID4gVGhhdCB3b3VsZCBoYXZlIHRvIGJlIHF1aXRlIGRlZXAgcmVjdXJzaW9uLiAgCj4gPiA+
Cj4gPiA+IER1cmluZyB0aGUgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIEFSTSBHQ1MgdjMgc2VyaWVz
LCBjb21tdW5pdHkgcG9pbnRlZAo+ID4gPiBvdXQgdGhhdCBhIDRHIHNoYWRvdyBzdGFjayBtaWdo
dCBiZSB0b28gbGFyZ2UuIFRoaXMgc2l6ZSBpcyBoYXJkIHRvCj4gPiA+IHN1cHBvcnQgaW4gbWVt
b3J5LWNvbnN0cmFpbmVkIGVudmlyb25tZW50cyBsaWtlIEFuZHJvaWQuIEhvd2V2ZXIsIHRoZQo+
ID4gPiBzaXplIGNhbm5vdCBiZSB0b28gc21hbGwgZWl0aGVyLCBvciB3ZSBtaWdodCBmYWNlIHN0
YWNrIG92ZXJmbG93Cj4gPiA+IGlzc3Vlcy4gQXQgdGhhdCB0aW1lLCBhIHBlcmZlY3Qgc2l6ZSB3
YXMgbm90IGRlY2lkZWQuICAKPiA+Cj4gPiBJdCBpcyBvbmx5IFZBIG5vdCByZWFsIG1lbW9yeSBz
byBzaG91bGRuJ3QgbWFrZSBtdWNoIGRpZmZlcmVuY2UgdG8gbWVtb3J5Cj4gPiB1c2UgKGV4Y2Vw
dCBmb3Igbm9tbXUgd2hlcmUgdGhlIGFjdHVhbCBtZW1vcnkgaGFzIHRvIGJlIGFsbG9jYXRlZCku
Cj4gPiAgCj4gCj4gWW91IHJhaXNlIGEgdmFsaWQgcG9pbnQgdGhhdCBzaGFkb3cgc3RhY2tzIGFy
ZSBwcmltYXJpbHkgYSBWQQo+IGFsbG9jYXRpb24uIEhvd2V2ZXIsIGluIExpbnV4LCB0aGUgbWVt
b3J5IG92ZXJjb21taXQgbWVjaGFuaXNtIGNyZWF0ZXMKPiBhIHByYWN0aWNhbCBsaW5rIGJldHdl
ZW4gVkEgYWxsb2NhdGlvbiBhbmQgcGh5c2ljYWwgbWVtb3J5IGNhcGFjaXR5Lgo+IEFzIEkgbWVu
dGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgbWVtb3J5IGFsbG9jYXRpb24gd2lsbCBmYWls
IHdoZW4KPiB0aGUgb3ZlcmNvbW1pdCBtb2RlIGlzIHNldCB0byBPVkVSQ09NTUlUX0dVRVNTIG9y
IE9WRVJDT01NSVRfTkVWRVIuCj4gCj4gSW4gX192bV9lbm91Z2hfbWVtb3J5Ogo+ICAgICAgICAg
aWYgKHBhZ2VzID4gdG90YWxyYW1fcGFnZXMoKSArIHRvdGFsX3N3YXBfcGFnZXMpCj4gICAgICAg
ICAgICAgICAgIGdvdG8gZXJyb3I7Cj4gCj4gTWFueSBwYWdlIHJlcXVlc3RzIGZvciBWQSB3aWxs
IGZhaWwgaWYgdGhlIHJlcXVlc3RlZCBzaXplIGV4Y2VlZHMgdGhlCj4gc3lzdGVtJ3MgdG90YWwg
UkFNIHBsdXMgU3dhcC4gT24gbWVtb3J5LWNvbnN0cmFpbmVkIHN5c3RlbXMsCj4gYWxsb2NhdGlu
ZyBhIG1hc3NpdmUgNEdCIHNoYWRvdyBzdGFjayBwZXIgdGhyZWFkIHdvdWxkIGltbWVkaWF0ZWx5
Cj4gdHJpZ2dlciB0aGlzIGVycm9yLgoKQnV0IHJlZHVjaW5nIHRoZSBzaXplIGJ5IGhhbGYgbWFr
ZXMgbGl0dGxlIGRpZmZlcmVuY2UuCllvdSdkIG5lZWQgYSBtdWNoIGJpZ2dlciByZWR1Y3Rpb24g
dG8gbWFrZSBhbnkgcmVhbCBkaWZmZXJlbmNlLgoKLS0gRGF2aWQKCj4gCj4gPiBCdXQgMzJiaXQg
cHJvZ3JhbXMgd2l0aCBsb3RzIG9mIHRocmVhZHMgY2FuIHJ1biBvdXQgb2YgVkEuCj4gPiBJbmNy
ZWFzaW5nIHRoZSBzdGFjayBWQSBzaXplIGJ5IDUwJSBtaWdodCBldmVuIGdpdmUgcHJvYmxlbXMg
Zm9yIDY0Yml0Cj4gPiBwcm9ncmFtcyAtIGlmIHRoZXkgYXJlIGFscmVhZHkgcmVkdWNpbmcgdGhl
IHRocmVhZCBzdGFjayBzaXplIGF2b2lkCj4gPiBydW5uaW5nIG91dCBvZiBWQS4KPiA+Cj4gPiBJ
J3ZlIG5vdCBjaGVja2VkLCBidXQgcHRocmVhZF9hdHRyX3NldHN0YWNrc2l6ZSgpIHNldHMgYSBs
aW1pdCBmb3IgdGhlCj4gPiB0aHJlYWQgc3RhY2sgc2l6ZSAod2hpY2ggd291bGQgb3RoZXJ3aXNl
IGRlZmF1bHQgc28gcmxpbWl0KFNUQUNLKSkuCj4gPiBJIGRvbid0IGJlbGlldmUgaXQgc2hvdWxk
IHVwZGF0ZSB0aGUgcmxpbWl0IHZhbHVlIGl0c2VsZi4KPiA+IEluIHdoaWNoIGNhc2UgeW91IGFy
ZSB1c2luZyB0aGUgd3Jvbmcgc2l6ZS4KPiA+Cj4gPiBCdXQgZm9yIGEgdGhyZWFkIHdpdGggYSB2
ZXJ5IHJlZHVjZWQgc3RhY2sgKHNheSAxMjhrKSB5b3UgcHJvYmFibHkgb25seQo+ID4gbmVlZCAx
IHBhZ2Ugb2Ygc2hhZG93IHN0YWNrLCBhbnkgbW9yZSBjb3VsZCBlYXNpbHkgbGVhZCB0byBydW5u
aW5nIG91dAo+ID4gb2YgVkEuCj4gPgo+ID4gLS0gRGF2aWQgIAo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

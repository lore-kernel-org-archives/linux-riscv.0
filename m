Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19481C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QC0g68B8TX/Y/NsdoEjFCEB69pwHuUSWgArZqJn7lLw=; b=OWPHgTVBrOzw/A
	vKafef9s4kr2OJLjvBa11DbSqOVNB9aE3WsvOnQVJcucEJQaaf/t311oSAjV5HyztGzREa2qGlpZo
	OJXEIe1+cj5eIk3L4J51bHgpn0zAN8lqqZNunfgQ1swqE+awj3/MBDo9XzjT3JNCzy3WCPRdqfS4t
	NvlISZt/YEUOpidRIrt6pwNY+MjOCR34Ewt0eLW7em+/QMYv8gL04wsGqFfe+a1ljyU3OFf3zTbKq
	n4uoSew+C65Gg5x0ajLmoADiL1T1rAdPvQrHU6FuhSP4U+piGV98P4zfjZ98y3ywLMAN3cDIw2T6X
	d6Lpuoduc8yLKccjDvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFq4h-00GIXa-0g;
	Wed, 20 Dec 2023 06:28:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFq4e-00GIWp-0H
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 06:28:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c580ba223so66566775e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 22:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703053733; x=1703658533; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RPPmR/uM9nAC/lsb/R3M+XWi3zjQqfwtT2yANqByHhs=;
        b=Gxoo+E+AwpH3q4L9e3CkcCu5XJcNxSHsZ2MR8w+d6KnkqaHrQ9j1VuUg2IAeCapaHs
         iCbDKuQvLyiy6uW2+HUha7zzRBMadkS9vrs77qLLwYbAjefLtDzEf3HIj+cwROrvVynZ
         SPsoTzu58B93ho+n0w1Ews0DekJ8EVbS3WnTP0qbqm0KviKINgDyqOrF/DOCbRy7sUxf
         DoWCB9ootpaBJTbBQi8gvLLo89zG7bVx9yDMwI8fwBI1Hn6OKuXBFTwPucHKl5lqqe6j
         9zu8VDc64d11McYqecXvHojg0csXhY50PgXPhqlMiDbtM1gBq6NZ9zoQkm+ISPYBWrJW
         lJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703053733; x=1703658533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPPmR/uM9nAC/lsb/R3M+XWi3zjQqfwtT2yANqByHhs=;
        b=QkVPScu+XyFN41HK6fBonjI1CCdpz6bvqaoHVGVIsoRwPHw7GCw6CFSq44ojT2y7Zl
         SWfkRElMxk/4XAL4CUmsanfMq/OOZNJUjnAw7CaPfxn5IuLiKs1LNSDixftovaMxKQNJ
         Rz/9yFbBOwDrl9WRVTg+zy8SiPQj/jw9nBxPLuxD/z1riUK5f8ZlpQv83+r6Nhqpz8iH
         lw6EwIiDgxtajoD+GAvCKIYlt1dJ6Pbyx9avv3FlZwU1ARI2t0CS0wmdxlkI95i8wotK
         CagvYFShT33OzDGGXaH0HwZO0bU18LWPUs5Cyf+nOYp/cOg1hcSqesyxjmJ8pfhdky6z
         BDrA==
X-Gm-Message-State: AOJu0YzMsccP16i5qtK7e26a2S73M/Rpud1VKuETzM3/lW6I6lKGbAP2
	29S45BriyWsKooUTsu8kY6sm5w==
X-Google-Smtp-Source: AGHT+IEuui6TSNxo/rZ9doeCkkv2CjoSQEkhy8rtjUJ/m/SdfFAEOgyS4RYG9Taw1AzEpZfqB81lvQ==
X-Received: by 2002:a05:600c:2047:b0:40c:3dd7:98dc with SMTP id p7-20020a05600c204700b0040c3dd798dcmr9979769wmg.75.1703053733337;
        Tue, 19 Dec 2023 22:28:53 -0800 (PST)
Received: from localhost (cst-prg-1-247.cust.vodafone.cz. [46.135.1.247])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c311200b0040d2524270asm5860417wmo.8.2023.12.19.22.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 22:28:53 -0800 (PST)
Date: Wed, 20 Dec 2023 07:28:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, pbonzini@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	srivatsa@csail.mit.edu, guoren@kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v3 11/13] RISC-V: KVM: selftests: Add
 guest_sbi_probe_extension
Message-ID: <20231220-3a173b8727d455756f691508@orel>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
 <20231217204019.36492-26-ajones@ventanamicro.com>
 <CAOnJCUKu1069YXRWopFDjRobF4jjskdFJMQH1oD2wPc+9JoBmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUKu1069YXRWopFDjRobF4jjskdFJMQH1oD2wPc+9JoBmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_222856_127429_B8BAB864 
X-CRM114-Status: GOOD (  24.93  )
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMDE6NTc6MjFQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgZ3Vlc3Rfc2JpX3Byb2Jl
X2V4dGVuc2lvbigpLCBhbGxvd2luZyBndWVzdCBjb2RlIHRvIHByb2JlIGZvcgo+ID4gU0JJIGV4
dGVuc2lvbnMuIEFzIGd1ZXN0X3NiaV9wcm9iZV9leHRlbnNpb24oKSBuZWVkcwo+ID4gU0JJX0VS
Ul9OT1RfU1VQUE9SVEVELCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBicmluZyBpbiBhbGwgU0JJ
Cj4gPiBlcnJvciBjb2Rlcy4gV2UgZG9uJ3QgYnJpbmcgaW4gYWxsIGN1cnJlbnQgZXh0ZW5zaW9u
IElEcyBvciBiYXNlCj4gPiBleHRlbnNpb24gZnVuY3Rpb24gSURzIHRob3VnaCwgZXZlbiB0aG91
Z2ggd2UgbmVlZCBvbmUgb2YgZWFjaCwKPiA+IGJlY2F1c2Ugd2UnZCBwcmVmZXIgdG8gYnJpbmcg
dGhvc2UgaW4gYXMgbmVjZXNzYXJ5Lgo+ID4KPiA+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvcmlzY3YvcHJvY2Vzc29yLmggICB8IDIxICsrKysrKysrKysrKysrKysrKysKPiA+ICAuLi4v
c2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgICAgICAgfCAxOSArKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9j
ZXNzb3IuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nl
c3Nvci5oCj4gPiBpbmRleCBlNzBjY2RhMjAxMWIuLmRjNTBhZDYyZTE1MCAxMDA2NDQKPiA+IC0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5o
Cj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9j
ZXNzb3IuaAo+ID4gQEAgLTEwOCw2ICsxMDgsMTcgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBf
X2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwgdWludDY0X3Qgc3VidHlwZSwKPiA+ICAjZGVmaW5l
IFNBVFBfQVNJRF9TSElGVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDQKPiA+ICAj
ZGVmaW5lIFNBVFBfQVNJRF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgIF9BQygweEZGRkYs
IFVMKQo+ID4KPiA+ICsvKiBTQkkgcmV0dXJuIGVycm9yIGNvZGVzICovCj4gPiArI2RlZmluZSBT
QklfU1VDQ0VTUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAwCj4gPiArI2RlZmluZSBTQklf
RVJSX0ZBSUxVUkUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0xCj4gPiArI2RlZmlu
ZSBTQklfRVJSX05PVF9TVVBQT1JURUQgICAgICAgICAgICAgICAgICAtMgo+ID4gKyNkZWZpbmUg
U0JJX0VSUl9JTlZBTElEX1BBUkFNICAgICAgICAgICAgICAgICAgLTMKPiA+ICsjZGVmaW5lIFNC
SV9FUlJfREVOSUVEICAgICAgICAgICAgICAgICAgICAgICAgIC00Cj4gPiArI2RlZmluZSBTQklf
RVJSX0lOVkFMSURfQUREUkVTUyAgICAgICAgICAgICAgICAgICAgICAgIC01Cj4gPiArI2RlZmlu
ZSBTQklfRVJSX0FMUkVBRFlfQVZBSUxBQkxFICAgICAgICAgICAgICAtNgo+ID4gKyNkZWZpbmUg
U0JJX0VSUl9BTFJFQURZX1NUQVJURUQgICAgICAgICAgICAgICAgICAgICAgICAtNwo+ID4gKyNk
ZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgICAgICAgICAgICAgICAgICAgICAgICAtOAo+
ID4gKwo+IAo+IEFkZCBTQklfRVJSX05PX1NITUVNIGFzIHdlbGwgPwoKSSBjYW4gYWRkIGl0IG5v
dyB0byBzZWxmdGVzdHMsIGJ1dCBpdCB3b24ndCBnZXQgdXNlZCAoc3RlYWwtdGltZSBkb2Vzbid0
CnVzZSBpdCBzaW5jZSBpdCBkb2Vzbid0IGhhdmUgYW55IFNCSSBmdW5jdGlvbnMgdGhhdCB1c2Ug
YW4gYWxyZWFkeSBzZXQgdXAKc2hhcmVkIG1lbW9yeSByZWdpb24pLiBJdCdzIGFsc28gbm90IHll
dCBpbiBMaW51eCwgc28gS1ZNIHNlbGZ0ZXN0cyB3b3VsZApiZSAiYWhlYWQiIG9mIExpbnV4IGlu
IHRoaXMgcmVnYXJkLiBBbmQsIHdoaWxlIHRoZSBuYW1pbmcgc2hvdWxkbid0IGJlCmNvbnRyb3Zl
cnNpYWwsIEkgc3VwcG9zZSB3ZSBzaG91bGQgY29tbWl0IHRoZSBuYW1lIHRvIExpbnV4IGZpcnN0
IHRvIGJlIHN1cmUKd2UgcG9ydCBpdCBjb3JyZWN0bHkgaGVyZS4gU28gbGV0J3Mgd2FpdCB1bnRp
bCB3ZSBoYXZlIGEgS1ZNIHNlbGZ0ZXN0cwp1c2VyLCB3aGljaCBtZWFucyBpdCdsbCBhbHNvIGJl
IGluIExpbnV4LgoKPiAKPiA+ICAjZGVmaW5lIFNCSV9FWFRfRVhQRVJJTUVOVEFMX1NUQVJUICAg
ICAgICAgICAgIDB4MDgwMDAwMDAKPiA+ICAjZGVmaW5lIFNCSV9FWFRfRVhQRVJJTUVOVEFMX0VO
RCAgICAgICAgICAgICAgIDB4MDhGRkZGRkYKPiA+Cj4gPiBAQCAtMTE1LDYgKzEyNiwxNCBAQCBz
dGF0aWMgaW5saW5lIHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRfdCB0eXBlLCB1aW50NjRf
dCBzdWJ0eXBlLAo+ID4gICNkZWZpbmUgS1ZNX1JJU0NWX1NFTEZURVNUU19TQklfVUNBTEwgICAg
ICAgICAgMAo+ID4gICNkZWZpbmUgS1ZNX1JJU0NWX1NFTEZURVNUU19TQklfVU5FWFAgICAgICAg
ICAgMQo+ID4KPiA+ICtlbnVtIHNiaV9leHRfaWQgewo+ID4gKyAgICAgICBTQklfRVhUX0JBU0Ug
PSAweDEwLAo+ID4gK307Cj4gPiArCj4gPiArZW51bSBzYmlfZXh0X2Jhc2VfZmlkIHsKPiA+ICsg
ICAgICAgU0JJX0VYVF9CQVNFX1BST0JFX0VYVCA9IDMsCj4gPiArfTsKPiA+ICsKPiA+ICBzdHJ1
Y3Qgc2JpcmV0IHsKPiA+ICAgICAgICAgbG9uZyBlcnJvcjsKPiA+ICAgICAgICAgbG9uZyB2YWx1
ZTsKPiA+IEBAIC0xMjUsNCArMTQ0LDYgQEAgc3RydWN0IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4
dCwgaW50IGZpZCwgdW5zaWduZWQgbG9uZyBhcmcwLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBhcmczLCB1bnNpZ25lZCBsb25nIGFyZzQsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzUpOwo+ID4KPiA+ICtib29sIGd1ZXN0X3Ni
aV9wcm9iZV9leHRlbnNpb24oaW50IGV4dGlkLCBsb25nICpvdXRfdmFsKTsKPiA+ICsKPiA+ICAj
ZW5kaWYgLyogU0VMRlRFU1RfS1ZNX1BST0NFU1NPUl9IICovCj4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiA+IGluZGV4IDY5MDVh
NDM0ODM4MC4uN2NhNzM2ZmI0MTk0IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+ID4gQEAgLTM5MywzICszOTMsMjIg
QEAgc3RydWN0IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWduZWQgbG9u
ZyBhcmcwLAo+ID4KPiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICB9Cj4gPiArCj4gPiArYm9v
bCBndWVzdF9zYmlfcHJvYmVfZXh0ZW5zaW9uKGludCBleHRpZCwgbG9uZyAqb3V0X3ZhbCkKPiA+
ICt7Cj4gPiArICAgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+ID4gKwo+ID4gKyAgICAgICByZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9CQVNFLCBTQklfRVhUX0JBU0VfUFJPQkVfRVhULCBleHRpZCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDAsIDAsIDAsIDAsIDApOwo+ID4gKwo+ID4gKyAg
ICAgICBfX0dVRVNUX0FTU0VSVCghcmV0LmVycm9yIHx8IHJldC5lcnJvciA9PSBTQklfRVJSX05P
VF9TVVBQT1JURUQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICJyZXQuZXJyb3I9JWxkLCBy
ZXQudmFsdWU9JWxkXG4iLCByZXQuZXJyb3IsIHJldC52YWx1ZSk7Cj4gPiArCj4gPiArICAgICAg
IGlmIChyZXQuZXJyb3IgPT0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEKQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKG91dF92YWwpCj4gPiArICAg
ICAgICAgICAgICAgKm91dF92YWwgPSByZXQudmFsdWU7Cj4gPiArCj4gPiArICAgICAgIHJldHVy
biB0cnVlOwo+ID4gK30KPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gCj4gCj4gQXBhcnQgZnJvbSB0
aGF0LCBMR1RNLgo+IAo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KClRoYW5rcywKZHJldwoKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IEF0aXNoCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

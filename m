Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A910C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7MlQAUwkuSmUaA1gzx0X3FrmDZDhOXkyMZv8SMgYHk=; b=lo0tHW3zufwEuw
	oGujY7sBkj19Xho0/5ZgHgRt0cQ3vwtkXUF3RKoUKytNvWjv/9fM9/BCB/9vUa27rIk6HlW8B4N9x
	fTcmWq0ULlZA6NDcbBy9Hg7D2BvnM4CKvNxQFA2rNt+q2TnmvFObo/Rj9x3zbzpNBlb8b20ad21aS
	QOLN2n3fmI96X8es65Z6geQsE3UDlbJpU4wravLzRv9h+Ln5EZWQmv9D0UOzkDTZVC4R/SJG3dK/t
	iSfAjBGCWkzVqUWoEpJyWzPVzVjvjf0H6OOB/t8MjBO3e3CQHq2JStOHH9/j7LAUe/eSTYMWgkmqZ
	yz+j+6jUJpMprvPLkHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnfr-0000000CEYJ-3p2z;
	Thu, 13 Mar 2025 18:52:55 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn2T-0000000C9dA-1qGN
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 18:12:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so2282690a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741889532; x=1742494332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swndidqFROwOBEqG3wesdy7WmWrjyR83c+ssL3XTYOw=;
        b=Aa0u+W1g54FdwSknQwHeFt+b4j5XrkRhqb8SfaQYOg5G2Z7sNHcnpspK0NvBAIXTlm
         MW76i/Q8tef1GEtOQ5rB8sDvrhB8VJwI0yir4PX8NXidEaiqcCsMzsUbZ2iJc1GBWw8F
         AVCss8hz7USDRD0azZ15f9LwmoKzTu5sbCRYAq4wKAV4xLwf0jk4Ej1cdlC0/a0TxMy2
         EEIf5Pp/Ph/9qnXPuwIqPNjykFZq5/FoWtwM9h1eV797T86W1DUyjXjq9c1Z/UDl45uS
         1TIbKd7IHVg01GcmZGpWRL+NW+brR0w22agiF8fF+nl7c6LHw7BRQPWDNyL0BI+u+7v2
         HKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741889532; x=1742494332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swndidqFROwOBEqG3wesdy7WmWrjyR83c+ssL3XTYOw=;
        b=MZcANvGSsivNouKtNmSOu0y83NLpyc9YVJdzsOQAwFB1bkBD56WIQW8ehk3JQFXPzE
         8vt4wa2yZ8xVsGsolpuTfXgPpYJIWg9LyfuWQ71gZ6no3XXQdx4eMeXMIeyspbkjiNM+
         JHdSkYH/rabNWGxXqU2qsEnUcgMwLnYAKmX8lFSyd2yP7jPEZrE7Rcz5lRP8KP/YPE3p
         TOHk9GFtPEisDcg4YBeDQG4jTQie6oERB2+3Bex6o2Pb1g4dq6KDRM3Vj5tcZLY4frms
         lQZaUbfIDNMD1sA6RSePW6hQ7W77FMRa1dHYI2SNHOv52ApyvYwmEThigu3bTr9/kVnp
         wpSg==
X-Forwarded-Encrypted: i=1; AJvYcCXPcnHGJkYeKGrr4xgQsEsj/Mk7O3L290H8Cn7XzH3SQyxORrFI9WrHqIcX2u3caqbYs1eMjRUsm7lQTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjnxKoCw+XEjqArcIQT8nX8MgC5plqbfTZFUdw6EsRY+cRh2TP
	KO9fMSXXM7UUETA5ev26rJIX+ELeMMkz3aOmJwjIIbcpm50tI/uG4MGST7Sf3yzqrhtXM6jUeLs
	6prZEYnenfpbKkQgwdi7/2YBy1BU=
X-Gm-Gg: ASbGncvPvW/hcnTaK+W3gMx4xffHV9k5Ufa+dF932Ejb+u5Dnpmqo1lkpSkAhTFrThN
	yVDRHKxpTn7s4Puclto7c5m8JKfonT1EGUiXqi2g540JLE5S++L4GVTP/xdyAfq5g/3brRNNBpX
	btEf+SHWfBN+c+504B6gyFAolB
X-Google-Smtp-Source: AGHT+IFhWr0mQH/ORI3Oe/Ce66HJj5thevy7RQd2RtrRcph8GzEovPCbhC46lwWDqGllBV+kcJUT5GO0fdErRBMq8Cw=
X-Received: by 2002:a17:90b:1f86:b0:2fe:e0a9:49d4 with SMTP id
 98e67ed59e1d1-3014e80f07dmr677872a91.2.1741889532088; Thu, 13 Mar 2025
 11:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <20241127172908.17149-7-andybnac@gmail.com>
 <87ldtck8k0.fsf@all.your.base.are.belong.to.us> <Z9AwF5hwF0ES9Grl@andrea>
 <87ldtbwrdb.fsf@all.your.base.are.belong.to.us> <Z9B8vgdTq1M9r3_k@andrea>
In-Reply-To: <Z9B8vgdTq1M9r3_k@andrea>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 14 Mar 2025 02:12:01 +0800
X-Gm-Features: AQ5f1Jpg2qNW6FMkkw1vv-lje3Lj7loei2DrMtm_6kL3ZJ_w2QCD05L9hNNFzUg
Message-ID: <CAFTtA3NawdhM3fF_xc9a0EogaejHGWSxhWGre+FpLeXH9J+q5A@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel mode
To: Andrea Parri <parri.andrea@gmail.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bjorn@rivosinc.com, puranjay12@gmail.com, 
	alexghiti@rivosinc.com, yongxuan.wang@sifive.com, greentime.hu@sifive.com, 
	nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com, 
	eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_111213_480274_AF37A479 
X-CRM114-Status: GOOD (  18.70  )
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

QW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29tPiDmlrwgMjAyNeW5tDPmnIgxMuaX
pSDpgLHkuIkg5LiK5Y2IMjoxMeWvq+mBk++8mgo+Cj4gT24gVHVlLCBNYXIgMTEsIDIwMjUgYXQg
MDM6NTM6MzZQTSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+IEFuZHJlYSBQYXJyaSA8
cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JpdGVzOgo+ID4KPiA+ID4+IEZXSVcsIHRoZSBmb3Ig
Uy1JTVNJQyB0aGUgd3JpdGUgaXMgYWxyZWFkeSB3cml0ZWwoKSwgc28gd2UnbGwgaGF2ZSB0aGUK
PiA+ID4+IHRleHQgcGF0Y2hpbmcgYW5kIElQSSBvcmRlcmVkLiBSZWdhcmRsZXNzLCB0aGVyZSdz
IG1vcmUgdGhhbiBvbmUgZmxhdm9yCj4gPiA+PiBvZiBJUEkgb24gUklTQy1WIQo+ID4gPgo+ID4g
PiBBRkFJVSwgdGhpcyB3cml0ZWwoKSBpcyBpbnRlbmRlZCB0byBvcmRlciB0aGUgaW5zZXJ0aW9u
IChhbmQgdGhlIGluaXRpYWxpemF0aW9uKQo+ID4gPiBvZiB0aGUgQ1NEIG9iamVjdCBiZWZvcmUg
dGhlIE1NSU8gd3JpdGVzOyBzbywgdGhlICJyaWdodCBmaXgiIHNlZW1zIHRvIHR1cm4gdGhlCj4g
PiA+ICJvdGhlciBmbGF2b3JzIiBpbnRvIHVzaW5nIGEgd3JpdGVsKCkgb3IgcHJvdmlkaW5nIGEg
c2ltaWxhciBvcmRlcmluZyBndWFyYW50ZWUuCgpJIGZvdW5kIHRoYXQgQXBwbGUncyBhaWMgaXJx
Y2hpcCB1c2VzIHdyaXRlbF9yZWxheGVkIGZvciBzZW5kaW5nIElQSXMuCkkgYW0gbm90IHN1cmUg
aWYgaXQgaXMgYSBwcmFjdGljZSB1c2luZyByZWxheGVkIG1taW8gaW4gdGhlIGRyaXZlciB0bwpk
ZWFsIHdpdGggSVBJcy4gSSBhbSBtb3JlIGNvbnZpbmNlZCB0aGF0IGRyaXZlciBzaG91bGQgdXNl
IHRoZSByZWxheGVkCnZlcnNpb24gaWYgdGhlcmUgaXMgbm8gZGF0YS9pbyBkZXBlbmRlbmN5IGZv
ciB0aGUgZHJpdmVyIGl0c2VsZi4gQnV0Cml0IGlzIHRydWUgdGhhdCBhIGZlbmNlIGluIHRoZSBk
cml2ZXIgbWFrZXMgcHJvZ3JhbW1pbmcgZWFzaWVyLgoKPiA+Cj4gPiBZZXMsIHRoYXQncyBwcm9i
YWJseSB0aGUgcmlnaHQgYXBwcm9hY2gsIG9yIG1heWJlIGZvbGxvdy11cCEKPiA+Cj4gPiA+IEFz
IGEgYm9udXMsIHN1Y2ggY2hhbmdlIHNob3VsZCBhZGRyZXNzL2ZpeCBhbGwgY3VycmVudCBhbmQg
ZnV0dXJlIG9jY3VycmVuY2VzIG9mCj4gPiA+IHRoZSBtZXNzYWdlLXBhc3Npbmcgc2NlbmFyaW8g
aW4gcXVlc3Rpb24gKHRoZSBwYXRjaCBhZGRyZXNzZWQgdGhlIG9jY3VycmVuY2UgaW4KPiA+ID4g
Zmx1c2hfaWNhY2hlX2FsbCgpLCBidXQgdGhlcmUgYXBwZWFycyB0byBiZSBhIHNpbWlsYXIgb25l
IGluIGZsdXNoX2ljYWNoZV9tbSgpKS4KPiA+Cj4gPiBJbmRlZWQuIEkgd29uZGVyIGlmIHRoZSBT
QkkgcmVtb3RlIGZlbmNlLmkgbmVlZHMgaXQ/Cj4KPiBBaCEgIFNvIEkgYW0gbm90IGFsb25lOiBB
RkFJQ1QsIHRoYXQgcmVtYWlucyBhIG1hdHRlciBvZiBkaXNjdXNzaW9ucyB3aXRoIHlvdXIgU0VF
Cj4gdGVhbS9kZXZlbG9wZXJzLiAgOi18CgpBcyBmYXIgYXMgT3BlblNCSSBpcyBjb25jZXJuZWQs
IHRoZXJlIGlzIGEgd21iKCksIHdoaWNoIHRyYW5zbGF0ZWQgdG8KZmVuY2Ugb3csIG93LCBpbiB0
aGUgZ2VuZXJpYyBjb2RlIHBhdGguIFJlZ2FyZGxlc3MsIHRoZXJlIG1heSBiZSBtb3JlCnRoYW4g
b25lIGZsYXZvciBvZiBTQklzLCBzaG91bGQgd2UgYWxzbyBjb25zaWRlciB0aGF0PwoKVGhhbmtz
LApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

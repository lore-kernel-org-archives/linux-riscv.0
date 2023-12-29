Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A925EC46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9g3+Hw1NARdhbHq5FYlnvrTZJT/HRHegxXILqNoRF7w=; b=UQFe4PzRf/5y1l
	8OJ1G/Doi2LjSNygED6bWvH9KUJJxrQ82qAILD31TuqFZJFetHB/ku39XudFC0AQ9/4k79yZcYnKW
	Qll8iacoSlMNbFjkQ38TxuczSayC+nnkeHpe6QpTDwtmXBFJCYMxW7zrJX5XXpVjwbYT/dZ6O9nTE
	1/+J44m7IEHgPohsnio2QsHOSh6Z8adRr+2Q5ARRmnor7FWMiM6a0qYGO57LPXGDhnKi3/LwYpHlG
	+gaWi15FXoC+c5CqMWT6CxCmAq75TSrzm9aKeemrTGsRxzZG4lDQ6qtgmFZ70/pAWuak4y+rX4nOY
	yWGQOO9Oj+/Cjq4PH9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6k0-000KTZ-2L;
	Fri, 29 Dec 2023 06:53:08 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6jw-000KR6-0j
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 06:53:06 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-35fe8a4b373so18112955ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 22:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1703832782; x=1704437582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbWp45UYJe7tU3hlGSLFrqg8BGzZGAFYMRe8xTKog1o=;
        b=ej01ZNoyKaSUxpQh/+ceLbyzCk9ZnjKqYSluWy2GT6X6lAjoE3IKiYIsa1Qq+Www0i
         CClkGRipmZAKqSULzUG4NBOOyEkhNvydhoB7y7VaOOsSo9Wv2x2YuYvXMb6xyoUiD/9i
         dICn8Vvw3SudSp20bgGD/j6HgbLlp2XViu9wFGnGgYklwn6V7bw1GlFsiv6XH7omIPNG
         MtNDi8bwlJ55RVYl9ZkI8NVl47w19z63LQ/Txn99WgV1iMFX0qOYtkLz7cN5kw+cq1fg
         awvLtsIyzE8r+YbZmia5MAhd2GM+nQNtPugav5Syzon4nTveNVRqEfEc9p3a1581PfJq
         N2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703832782; x=1704437582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbWp45UYJe7tU3hlGSLFrqg8BGzZGAFYMRe8xTKog1o=;
        b=NdIjTKtuOgsGaXbHCnYJOjqbdCMrF0KTYefBVrZNWOo9iqjnKrCYO4rIwOsPI5tEYT
         fLVYGHI2kPCXgSSnX4uKFqBOSgEq0l1Cwu1M3g2ctgKzTOs9p5Rb5ICDOP+Vi0JJBBmz
         w81uB/9nrx2rSAn4xTNuZ92epSjrvIN7AEIPyPN7sgX8pzWZ4zROSeI6kcteEt/AVD5l
         9QHl0yI47RQQN27zE8iE8XsgxhSlHWXtteRmyVihPmGA0A/kOF7+zdizjSl9Wu7il82T
         ibFUh712KNX5p/ex54pcFdNMM45EwXZ/fSUJyN54e7N/ycKWpN3PaXnKXnZJnJAxkpRd
         nU4Q==
X-Gm-Message-State: AOJu0YwujCQHFUIjSLCEDXiXzsqBoUEdu3QbTo6wz6tN9CGzNVvDJefg
	fdnG85nXRGb4OeLBkoN5ccCKOaS3M9dNZF0TVeBwr1L2417tog==
X-Google-Smtp-Source: AGHT+IGjtoW3ZKMNvTG22T56ZE06r07SaCF79NbMkxT+Ps8tRkOe6zAuixK6sGX5beJkL1A0gI4pkU1aIJ1tup+tTn0=
X-Received: by 2002:a92:c549:0:b0:35f:ee15:742c with SMTP id
 a9-20020a92c549000000b0035fee15742cmr9850970ilj.7.1703832782053; Thu, 28 Dec
 2023 22:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20231220160012.40184-15-ajones@ventanamicro.com>
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 Dec 2023 12:22:50 +0530
Message-ID: <CAAhSdy3V3c6D16iCdGuXGPwgcT2Jqj_=3b-WbghRPQNTtruzHw@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] RISC-V: Add steal-time support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_225304_434383_8E9F5771 
X-CRM114-Status: GOOD (  23.65  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgOTozMOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT25lIGZyZXF1ZW50bHkgdG91dGVkIGJlbmVmaXQg
b2YgdmlydHVhbGl6YXRpb24gaXMgdGhlIGFiaWxpdHkgdG8KPiBjb25zb2xpZGF0ZSBtYWNoaW5l
cywgaW5jcmVhc2luZyByZXNvdXJjZSB1dGlsaXphdGlvbi4gIEl0IG1heSBldmVuIGJlCj4gZGVz
aXJhYmxlIHRvIG92ZXJjb21taXQsIGF0IHRoZSByaXNrIG9mIG9uZSBvciBtb3JlIFZDUFVzIGhh
dmluZyB0byB3YWl0Lgo+IEh5cGVydmlzb3JzIHdoaWNoIGhhdmUgaW50ZXJmYWNlcyBmb3IgZ3Vl
c3RzIHRvIHJldHJpZXZlIHRoZSBhbW91bnQgb2YKPiB0aW1lIGVhY2ggVkNQVSBoYWQgdG8gd2Fp
dCBnaXZlIG9ic2VydmVycyB3aXRoaW4gdGhlIGd1ZXN0cyB3YXlzIHRvCj4gYWNjb3VudCBmb3Ig
bGVzcyBwcm9ncmVzcyB0aGFuIHdvdWxkIG90aGVyd2lzZSBiZSBleHBlY3RlZC4gVGhlIFNCSSBT
VEEKPiBleHRlbnNpb25bMV0gcHJvdmlkZXMgYSBzdGFuZGFyZCBpbnRlcmZhY2UgZm9yIGd1ZXN0
IFZDUFVzIHRvIHJldHJpZXZlCj4gdGhlIGFtb3VudCBvZiB0aW1lICJzdG9sZW4iLgo+Cj4gVGhp
cyBzZXJpZXMgaGFzIHRocmVlIHBhcnRzOgo+ICAxKSBQYXRjaGVzIDAxLTAzIC0gQWRkIHBhcmF2
aXJ0IHN1cHBvcnQgdG8gUklTQy1WIGFuZCBpbXBsZW1lbnQKPiAgICAgICAgICAgICAgICAgICAg
IHN0ZWFsLXRpbWUgYWNjb3VudGluZyBzdXBwb3J0IHVzaW5nIHRoZSBTQkkgU1RBCj4gICAgICAg
ICAgICAgICAgICAgICBleHRlbnNpb24uCj4gIDIpIFBhdGNoZXMgMDQtMDkgLSBJbXBsZW1lbnQg
U0JJIFNUQSBpbiBLVk0gc28gS1ZNIGd1ZXN0cywgc3VjaCBhcwo+ICAgICAgICAgICAgICAgICAg
ICAgTGludXggZ3Vlc3RzIHdoaWNoIGVuYWJsZSB0aGUgcGFyYXZpcnQgc3RlYWwtdGltZQo+ICAg
ICAgICAgICAgICAgICAgICAgc3VwcG9ydCwgY2FuIGJlIGVubGlnaHRlbmVkIGFib3V0IHN0b2xl
biB0aW1lLgo+ICAzKSBQYXRjaGVzIDEwLTEzIC0gQWRkIFJJU0MtViBzdXBwb3J0IHRvIHRoZSBL
Vk0gc2VsZnRlc3RzIHN0ZWFsX3RpbWUKPiAgICAgICAgICAgICAgICAgICAgIHRlc3QgYW5kIHRo
ZSBTQkkgZXh0ZW5zaW9uIHJlZ3MgaW4gdGhlIGdldC1yZWctbGlzdAo+ICAgICAgICAgICAgICAg
ICAgICAgdGVzdC4KPgo+IFRoZXNlIHBhdGNoZXMgYXJlIGJhc2VkIG9uIGt2bS1yaXNjdi9yaXNj
dl9rdm1fcXVldWUKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNj
di1zYmktZG9jL2Jsb2IvbWFzdGVyL3NyYy9leHQtc3RlYWwtdGltZS5hZG9jCj4KPiBUaGlzIHBh
dGNoZXMgYXJlIGFsc28gYXZhaWxhYmxlIGhlcmUKPiBodHRwczovL2dpdGh1Yi5jb20vam9uZXMt
ZHJldy9saW51eC9jb21taXRzL2t2bS9zdGVhbC10aW1lLXY0Cj4KPiBDaGFuZ2VzIHNpbmNlIHYz
Ogo+ICAtIFVzZSB3b3JrICJDb21wdXRpbmciIGluc3RlYWQgb2YgInVzaW5nIiBpbiBwcl9pbmZv
IFtBdGlzaF0KPiAgLSBSZW5hbWUgS1ZNX1JFR19SSVNDVl9TQkkgdG8gS1ZNX1JFR19SSVNDVl9T
QklfU1RBVEUgW0F0aXNoLCBBbnVwXQo+ICAtIFBpY2tlZCB1cCByLWIncyBmcm9tIEF0aXNoIGFu
ZCBBbnVwCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIEFsd2F5cyBjaGVjayBzZXF1ZW5jZSBp
biBjYXNlIHRoZSBTQkkgaW1wbCBpc24ndCB3cml0aW5nIHN0ZWFsCj4gICAgYXRvbWljYWxseSBb
QW51cF0KPiAgLSBDcmVhdGUgYSByZXNldCBmdW5jdGlvbiBmb3Igc3RhIGFuZCBhbHNvIHJlc2V0
IGxhc3Rfc3RlYWwgW0FudXBdCj4gIC0gUGlja2VkIHVwIEFudXAncyByLWIncwo+Cj4gQ2hhbmdl
cyBzaW5jZSB2MToKPiAgLSBzYmlfc3RhX3N0ZWFsX3RpbWVfc2V0X3NobWVtKCkgbm93IG1hcHMg
U0JJIGVycm9ycyB0byBsaW51eCBlcnJvcnMgW0Nvbm9yXQo+ICAtIFNxdWFzaGVkIHYxIHBhdGNo
IDQgaW50byB2MSBwYXRjaCAzIFtDb25vcl0KPiAgLSBNb3ZlZCBrdm1fcmlzY3ZfdmNwdV9zZXQv
Z2V0X3JlZ19zYmkoKSB0byBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gICAgd2hpY2ggc2Vl
bXMgbGlrZSBhIG1vcmUgYXBwcm9wcmlhdGUgZmlsZSBmb3IgdGhlbQo+ICAtIFJlYmFzZWQgb24g
a3ZtLXJpc2N2L3Jpc2N2X2t2bV9xdWV1ZSB3aGljaCBoYXMgYWxsIHRoZSBkZXBlbmRlbmNpZXMK
Pgo+IENoYW5nZXMgc2luY2UgUkZDOgo+ICAtIFJlYmFzZWQgb24gdjYuNy1yYzMgKHBsdXMgdGhl
IHBhdGNoZXMgbWVudGlvbmVkIGFib3ZlKQo+ICAtIEFkZGVkIGRlZmluZXMgZm9yIHRoZSAtMSdz
IFtDb25vcl0KPiAgLSBBZGRlZCBhIGNvbW1lbnQgdG8gdGhlIHN0ZWFsIHJlYWQgc2VxdWVuY2Ug
W0Nvbm9yXQo+ICAtIE9ubHkgZG8gdGhlIHN0ZWFsIHJlYWQgc2VxdWVuY2UgZm9yIDMyLWJpdCBh
bmQgYWRkZWQgUkVBRF9PTkNFJ3MKPiAgLSBDaGVjayBmb3IgU0JJIHYyLjAgaW1wbGVtZW50YXRp
b24KPiAgLSBSZW5hbWUgc2V0X3N0ZWFsX3RpbWVfc2htZW0gdG8gc3RlYWxfdGltZV9zZXRfc2ht
ZW0KPiAgLSBBZGQgZ2V0LXJlZy1saXN0IHN1cHBvcnQgYW5kIHRlc3Qgd2l0aCBnZXQtcmVnLWxp
c3Qga3NlbGZ0ZXN0Cj4gIC0gQSBmZXcgb3RoZXIgbWlub3IgaW1wcm92ZW1lbnRzCj4gIC0gUGlj
a2VkIHVwIG9uZSByLWIgZnJvbSBDb25vcgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+Cj4gQW5kcmV3
IEpvbmVzICgxMyk6Cj4gICBSSVNDLVY6IHBhcmF2aXJ0OiBBZGQgc2tlbGV0b24gZm9yIHB2LXRp
bWUgc3VwcG9ydAo+ICAgUklTQy1WOiBBZGQgU0JJIFNUQSBleHRlbnNpb24gZGVmaW5pdGlvbnMK
PiAgIFJJU0MtVjogcGFyYXZpcnQ6IEltcGxlbWVudCBzdGVhbC10aW1lIHN1cHBvcnQKPiAgIFJJ
U0MtVjogS1ZNOiBBZGQgU0JJIFNUQSBleHRlbnNpb24gc2tlbGV0b24KPiAgIFJJU0MtVjogS1ZN
OiBBZGQgc3RlYWwtdXBkYXRlIHZjcHUgcmVxdWVzdAo+ICAgUklTQy1WOiBLVk06IEFkZCBTQkkg
U1RBIGluZm8gdG8gdmNwdV9hcmNoCj4gICBSSVNDLVY6IEtWTTogQWRkIHN1cHBvcnQgZm9yIFNC
SSBleHRlbnNpb24gcmVnaXN0ZXJzCj4gICBSSVNDLVY6IEtWTTogQWRkIHN1cHBvcnQgZm9yIFNC
SSBTVEEgcmVnaXN0ZXJzCj4gICBSSVNDLVY6IEtWTTogSW1wbGVtZW50IFNCSSBTVEEgZXh0ZW5z
aW9uCj4gICBSSVNDLVY6IEtWTTogc2VsZnRlc3RzOiBNb3ZlIHNiaV9lY2FsbCB0byBwcm9jZXNz
b3IuYwo+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czogQWRkIGd1ZXN0X3NiaV9wcm9iZV9leHRl
bnNpb24KPiAgIFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IEFkZCBzdGVhbF90aW1lIHRlc3Qgc3Vw
cG9ydAo+ICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czogQWRkIGdldC1yZWctbGlzdCB0ZXN0IGZv
ciBTVEEgcmVnaXN0ZXJzCgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTYuOAoKVGhhbmtz
LApBbnVwCgo+Cj4gIC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAg
ICB8ICAgNiArLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTkgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICAgICAg
ICAgIHwgIDEwICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICAg
ICAgIHwgIDEwICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXJhdmlydC5oICAgICAgICAg
ICAgIHwgIDI4ICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X2FwaV9jbG9j
ay5oICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgICAgICAgICAg
ICAgICAgfCAgMTcgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAg
ICAgICAgIHwgIDEzICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAg
ICAgICAgICB8IDEzNCArKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDMgKwo+ICBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5j
ICAgICAgICAgICAgICAgICAgfCAgNTEgKysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YyAgICAgICAgICAgICAgICAgICAgIHwgIDY3ICsrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9zdGEuYyAgICAgICAgICAgICAgICAgfCAyMDggKysrKysrKysrKysrKysrKysrCj4gIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZSAgICAgICAgICB8ICAgNSArLQo+ICAu
Li4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICAgfCAgMjIgKysKPiAg
Li4uL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jICAgICAgIHwgIDQ1ICsrKysK
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jIHwgIDI2IC0t
LQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgNDMg
KysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vc3RlYWxfdGltZS5jICAgICAgfCAg
OTkgKysrKysrKysrCj4gIDIzIGZpbGVzIGNoYW5nZWQsIDc4MiBpbnNlcnRpb25zKCspLCAzNSBk
ZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGFyYXZpcnQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
YXJhdmlydF9hcGlfY2xvY2suaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJu
ZWwvcGFyYXZpcnQuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdmNwdV9z
Ymlfc3RhLmMKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK

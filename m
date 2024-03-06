Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB931C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fHpSCGPtpnx7yx/162yXpL+D6p0xHHgJR6bK6FHqOyU=; b=s148KhxHH32WTpWtWe3e0c32gJ
	/6SAwut8kGI1SL43R55j2/6ur/86tS9w3MxePi0PZ6WRU88QQag9KMFMI6jBZT2aKQLYDCc6j/82X
	fh1sWA8EnJs+vnoY76qfowFRdfO8kNSZI6oUa5DmqLgGUb3eAYNxkdcaccCumCIUTMjx815iwK3L/
	ZHrRbBstqB5lSG4UZ869KjIbB+AbmCGCchswFUk8rzcc6XAwLA9tavxTPFbKBVANt+ipFektsnB3h
	4Z3mzO4k/8jK0u+I1OO5nDnDRqRt9Eh08BgNA4yRGKdKX1Nokrk/nsM0IJ8tZlbouv83ITV4LM/cB
	WECrkl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rht5K-00000000lKW-0NEr;
	Wed, 06 Mar 2024 15:21:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rht5G-00000000lJg-19qA
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 15:21:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dc1ff58fe4so8893805ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709738489; x=1710343289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8Qqx9ooCSBKu7MZRWmQy03iinWuJivXIhQKkqlVv5I=;
        b=pz+hXQJeEYKSxedJ3LyvJYAd2Elpgg3D89yKaukVa8xpLKKrPVoGjNquWFh2OXkgBz
         yIR+TC4bwkVvTWO1BvasXKFRnXF8arIlSWKSDM0VjNtLsx+I38awnYhb4I+01cY4gEYz
         1420+O/aVsmY+cymeHFAzPE3W+F2QODDGbqeg6Opu6+nVpyrYEYNQjf+iUkmzMVvEm8b
         /3ramPKWqgfNw7E+E2kPWMkwmDGfi40WAmGs2YkbLFMSIxKkuEo87bP6YgB4lf7qkbqE
         DbdMobUX4dskzu9r1ya9r2ccEe+6AQ25EEj4IvXtm5Uc//ozESyhCZTETLGmSOhcC0Aq
         trbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709738489; x=1710343289;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8Qqx9ooCSBKu7MZRWmQy03iinWuJivXIhQKkqlVv5I=;
        b=KDmXgADmTuAufqngGsqOKM6GKrUZ1+cuA15uI5Yv3gIW0vS7X5cysEHL2oocl9cTXp
         nIacW7a6243HgGnWQKGgcxAtaMJR9E4rfS/+AXeADkb/ryZe3/n7sEBzbQ7QL3U99DOi
         9WGY8pmBL7X+zax2kogkBr3LGlYBhBRumlsa2oXW0HWokywCDSWC0U6z93UsWYa+V3Mq
         DJZsG7gUjdklkWTNNAdLiZmrRVfMnR6LE/zXulBRPUYac7L8hmS4lX6WP1jLy7MgIwdQ
         Pb6RDyetaDbf9gCwAvNc5Qpe7RlNyQ1f232HaVrCNKZjdcrynFmP94To5p6C3+B7w4dq
         cqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHAoDvHECfU+pGYFw6RiZYW0sZtItE3fdq0SO1b8CJ8PBCn4a0JQaMZJ9vgXb30VfkaknDx5bPSWH1/9FPk4BK1XhWRjZZCHofdQca0zxn
X-Gm-Message-State: AOJu0YxjoWLG/Dz2L9uIyKiWwhDczFpALXcYzIpWYYUDuTu0eI9VQ/Tg
	Sg9Wua+vQMqxFtRpuJHe9BDxGmiz3VsVjifqnyB8MeqOk+3iAli6/1zdaigsPaQ=
X-Google-Smtp-Source: AGHT+IHS64f5maqdTjPkHR3rlh1H8dRVq7aDFlNHNq/juokRqXnYFlJ9FFwUBMnE7dQOFGHwlqSFxw==
X-Received: by 2002:a17:903:230a:b0:1dc:fb9d:402d with SMTP id d10-20020a170903230a00b001dcfb9d402dmr6231276plh.58.1709738488550;
        Wed, 06 Mar 2024 07:21:28 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id ld4-20020a170902fac400b001db5b39635dsm12783423plb.277.2024.03.06.07.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:21:27 -0800 (PST)
Date: Wed, 06 Mar 2024 07:21:27 -0800 (PST)
X-Google-Original-Date: Wed, 06 Mar 2024 07:21:17 PST (-0800)
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization of gp
In-Reply-To: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
CC: cuiyunhui@bytedance.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com,
  bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, kirill.shutemov@linux.intel.com,
  nathan@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-efi@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-c53211c1-4708-459a-bdc5-6e013c2adaee@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_072130_562284_C925EA83 
X-CRM114-Status: GOOD (  33.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwNiBNYXIgMjAyNCAwNTowOTowNyBQU1QgKC0wODAwKSwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDE0OjAyLCBBcmQgQmllc2hldXZlbCA8YXJk
YkBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDEzOjM0LCB5
dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBIaSBB
cmQsCj4+ID4KPj4gPiBPbiBXZWQsIE1hciA2LCAyMDI0IGF0IDU6MzbigK9QTSBBcmQgQmllc2hl
dXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPj4gPiA+Cj4+ID4gPiBPbiBXZWQsIDYgTWFy
IDIwMjQgYXQgMDk6NTYsIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90
ZToKPj4gPiA+ID4KPj4gPiA+ID4gQ29tcGFyZWQgd2l0aCBnY2MgdmVyc2lvbiAxMiwgZ2NjIHZl
cnNpb24gMTMgdXNlcyB0aGUgZ3AKPj4gPiA+ID4gcmVnaXN0ZXIgZm9yIGNvbXBpbGF0aW9uIG9w
dGltaXphdGlvbiwgYnV0IHRoZSBlZmlzdHViIG1vZHVsZQo+PiA+ID4gPiBkb2VzIG5vdCBpbml0
aWFsaXplIGdwLgo+PiA+ID4gPgo+PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxj
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPj4gPiA+ID4gQ28tRGV2ZWxvcGVkLWJ5OiBaaGlwZW5n
IFh1IDx4dXpoaXBlbmcuMTk3M0BieXRlZGFuY2UuY29tPgo+PiA+ID4KPj4gPiA+IFRoaXMgbmVl
ZHMgYSBzaWduLW9mZiwgYW5kIHlvdXIgc2lnbm9mZiBuZWVkcyB0byBjb21lIGFmdGVyLgo+PiA+
ID4KPj4gPiA+ID4gLS0tCj4+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMg
fCAxMSArKysrKysrKysrLQo+PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4gPiA+ID4KPj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VmaS1oZWFkZXIuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+
PiA+ID4gPiBpbmRleCA1MTViMmRmYmNhNzUuLmZhMTdjMDhjMDkyYSAxMDA2NDQKPj4gPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4+ID4gPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+PiA+ID4gPiBAQCAtNDAsNyArNDAsNyBAQCBvcHRp
b25hbF9oZWFkZXI6Cj4+ID4gPiA+ICAgICAgICAgLmxvbmcgICBfX3BlY29mZl9kYXRhX3ZpcnRf
ZW5kIC0gX19wZWNvZmZfdGV4dF9lbmQgICAgICAvLyBTaXplT2ZJbml0aWFsaXplZERhdGEKPj4g
PiA+ID4gICNlbmRpZgo+PiA+ID4gPiAgICAgICAgIC5sb25nICAgMCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8vIFNpemVPZlVuaW5pdGlhbGl6ZWREYXRhCj4+ID4gPiA+
IC0gICAgICAgLmxvbmcgICBfX2VmaXN0dWJfZWZpX3BlX2VudHJ5IC0gX3N0YXJ0ICAgICAgICAg
Ly8gQWRkcmVzc09mRW50cnlQb2ludAo+PiA+ID4gPiArICAgICAgIC5sb25nICAgX2VmaXN0dWJf
ZW50cnkgLSBfc3RhcnQgICAgICAgICAvLyBBZGRyZXNzT2ZFbnRyeVBvaW50Cj4+ID4gPiA+ICAg
ICAgICAgLmxvbmcgICBlZmlfaGVhZGVyX2VuZCAtIF9zdGFydCAgICAgICAgICAgICAgICAgLy8g
QmFzZU9mQ29kZQo+PiA+ID4gPiAgI2lmZGVmIENPTkZJR18zMkJJVAo+PiA+ID4gPiAgICAgICAg
IC5sb25nICBfX3BlY29mZl90ZXh0X2VuZCAtIF9zdGFydCAgICAgICAgICAgICAgIC8vIEJhc2VP
ZkRhdGEKPj4gPiA+ID4gQEAgLTEyMSw0ICsxMjEsMTMgQEAgc2VjdGlvbl90YWJsZToKPj4gPiA+
ID4KPj4gPiA+ID4gICAgICAgICAuYmFsaWduIDB4MTAwMAo+PiA+ID4gPiAgZWZpX2hlYWRlcl9l
bmQ6Cj4+ID4gPiA+ICsKPj4gPiA+ID4gKyAgICAgICAuZ2xvYmFsIF9lZmlzdHViX2VudHJ5Cj4+
ID4gPiA+ICtfZWZpc3R1Yl9lbnRyeToKPj4gPiA+Cj4+ID4gPiBUaGlzIHNob3VsZCBnbyBpbnRv
IC50ZXh0IG9yIC5pbml0LnRleHQsIG5vdCB0aGUgaGVhZGVyLgo+PiA+ID4KPj4gPiA+ID4gKyAg
ICAgICAvKiBSZWxvYWQgdGhlIGdsb2JhbCBwb2ludGVyICovCj4+ID4gPiA+ICsgICAgICAgbG9h
ZF9nbG9iYWxfcG9pbnRlcgo+PiA+ID4gPiArCj4+ID4gPgo+PiA+ID4gV2hhdCBpcyBzdXBwb3Nl
ZCB0byBoYXBwZW4gaGVyZSBpZiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0s9eT8gVGhlIEVGSQo+
PiA+ID4gc3R1YiBNYWtlZmlsZSByZW1vdmVzIHRoZSBTQ1MgQ0ZMQUdTLCBzbyB0aGUgc3R1YiB3
aWxsIGJlIGJ1aWx0Cj4+ID4gPiB3aXRob3V0IHNoYWRvdyBjYWxsIHN0YWNrIHN1cHBvcnQsIHdo
aWNoIEkgZ3Vlc3MgbWVhbnMgdGhhdCBpdCBtaWdodAo+PiA+ID4gdXNlIEdQIGFzIGEgZ2xvYmFs
IHBvaW50ZXIgYXMgdXN1YWw/Cj4+ID4gPgo+PiA+ID4gPiArICAgICAgIGNhbGwgX19lZmlzdHVi
X2VmaV9wZV9lbnRyeQo+PiA+ID4gPiArICAgICAgIHJldAo+PiA+ID4gPiArCj4+ID4gPgo+PiA+
ID4gWW91IGFyZSByZXR1cm5pbmcgdG8gdGhlIGZpcm13YXJlIGhlcmUsIGJ1dCBhZnRlciBtb2Rp
ZnlpbmcgdGhlIEdQCj4+ID4gPiByZWdpc3Rlci4gU2hvdWxkbid0IHlvdSByZXN0b3JlIGl0IHRv
IGl0cyBvbGQgdmFsdWU/Cj4+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byByZXN0b3JlIHRoZSB2YWx1
ZSBvZiB0aGUgZ3AgcmVnaXN0ZXIuIFdoZXJlIGdwIGlzCj4+ID4gbmVlZGVkLCB0aGUgZ3AgcmVn
aXN0ZXIgbXVzdCBmaXJzdCBiZSBpbml0aWFsaXplZC4gQW5kIGhlcmUgaXMgdGhlCj4+ID4gZW50
cnkuCj4+ID4KPj4KPj4gQnV0IGhvdyBzaG91bGQgdGhlIGZpcm13YXJlIGtub3cgdGhhdCBHUCB3
YXMgY29ycnVwdGVkIGFmdGVyIGNhbGxpbmcKPj4gdGhlIGtlcm5lbCdzIEVGSSBlbnRyeXBvaW50
PyBUaGUgRUZJIHN0dWIgY2FuIHJldHVybiB0byB0aGUgZmlybXdhcmUKPj4gaWYgaXQgZW5jb3Vu
dGVycyBhbnkgZXJyb3JzIHdoaWxlIHN0aWxsIHJ1bm5pbmcgaW4gdGhlIEVGSSBib290Cj4+IHNl
cnZpY2VzLgo+Pgo+Cj4gQWN0dWFsbHksIEkgd29uZGVyIGlmIEdQIGNhbiBiZSBtb2RpZmllZCBh
dCBhbGwgYmVmb3JlCj4gRXhpdEJvb3RTZXJ2aWNlcygpLiBUaGUgRUZJIHRpbWVyIGludGVycnVw
dCBpcyBzdGlsbCBsaXZlIGF0IHRoaXMKPiBwb2ludCwgYW5kIHNvIHRoZSBmaXJtd2FyZSBpcyBi
ZWluZyBjYWxsZWQgYmVoaW5kIHlvdXIgYmFjaywgYW5kIG1pZ2h0Cj4gcmVseSBvbiBHUCByZXRh
aW5pbmcgaXRzIG9yaWdpbmFsIHZhbHVlLgoKW0EgZmV3IG9mIHVzIGFyZSB0YWxraW5nIG9uIElS
QyBhcyBJJ20gd3JpdGluZyB0aGlzLi4uXQoKVGhlIFVFRkkgc3BlYyBzYXlzICJVRUZJIGZpcm13
YXJlIG11c3QgbmVpdGhlciB0cnVzdCB0aGUKdmFsdWVzIG9mIHRwIGFuZCBncCBub3IgbWFrZSBh
biBhc3N1bXB0aW9uIG9mIG93bmluZyB0aGUgd3JpdGUgYWNjZXNzIHRvIAp0aGVzZSByZWdpc3Rl
ciBpbiBhbnkgY2lyY3Vtc3RhbmNlcyIuICBJdCdzIGtpbmQgb2YgdmFndWUgd2hhdCAiVUVGSSAK
ZmlybXdhcmUiIG1lYW5zIGhlcmUsIGJ1dCBJIHRoaW5rIGl0J3MgcmVhc29uYWJsZSB0byBhc3N1
bWUgdGhhdCB0aGUgCmtlcm5lbCAoYW5kIHRodXMgdGhlIEVGSSBzdHViKSBpcyBub3QgaW5jbHVk
ZWQgdGhlcmUuCgpTbyB1bmRlciB0aGF0IGludGVycHJldGF0aW9uLCB0aGUga2VybmVsIChpbmNs
dWRpbmcgdGhlIEVGSSBzdHViKSB3b3VsZCAKYmUgYWxsb3dlZCB0byBvdmVyd3JpdGUgR1Agd2l0
aCB3aGF0ZXZlciBpdCB3YW50cy4KCltXZSdyZSBzdGlsbCB0YWxraW5nIG9uIElSQywgdGhvdWdo
XQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

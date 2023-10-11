Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD5ACD6E5B
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHQFmujuqZqRaiTyj6MShwlKeauzp10aKBjys9G1H+s=; b=YJ7CT7wCriV3tj
	u1M+M9DOkRw7/tTyga0jOFiCBDOYMCVR+m3GY4AM4GdUkcODhrYHabrC8CsOgWmYB/LwOdbZNEK+n
	c/Iigzc9zDZXX3udg4yRytmQj3Wlqfg0UcJCksxyFeBYLLIcCCOQju2p7hQMHUFzi4IuZDMEPJJDu
	w7ZqkEoEpbg0Pi6xJS8mMqU4MqZ6uWX1PyguFDsswA2d9o22RJaXuKsFJ5ehazFYcO9zh5jXmVux8
	KgR1K4CGG0ktWjZGsnQs1vy1BBa0mxS5BpGt1NYw+Fuq0cXbjYdz/LVbTeM97exQqpNJSLHCsDLwV
	qT4G9N0xhbjCB/aM8FeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWrV-00FdoY-3C;
	Wed, 11 Oct 2023 10:54:45 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWrS-00Fdjn-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 10:54:44 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4528cba7892so2841055137.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697021680; x=1697626480; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4nF6PEutWJBQPD4LIT1skkD09xa4qGsBtRI6mZk9kM=;
        b=nX3j5yt7ETtYvv5Be6SjgtM2BStg0DxtYrK3UemLnEoqCajr2IOiKrPb9NY8Tz6Gw1
         sDTH2ztqwEkvmUJnnSs7sUq68WYyjRC/42PI+5Ia9+zvkYatwpgrZTo8ZXtQJsxGr1Lk
         56XvbAUDQzWQBFcfXu7mHmlkntMh/MBqHLPAgR71PQwrxIoN++WVEQzxSKOLZiUxnRFK
         B6T5PPFao/rylmuGUdrp848SrUszL0SXwLstXitumv+NT8lmDbhLMgx3AUvzFrJcG90X
         RnjBSXMEpMHH7Glezhidd4/B7NMQRoknvXpNE6FJy6GeqgDZQsYVB69woKbQfJTnE8Z0
         fTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021680; x=1697626480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4nF6PEutWJBQPD4LIT1skkD09xa4qGsBtRI6mZk9kM=;
        b=pbtydSD0utTANWIBmGzMH2hj2U+Ky6GLwPvg4tQOz0onOZyp/7kZvx2Ve3aLSs9yjQ
         FPlTUT1Rm6xDrC8e6y6jBkTgjiuSgMEbgO45iQZ3NzHXdi81HU6EpyJD8kZL9SuYayxy
         a2LpyvE0Q7EW58T5k/8FuObyWiVlIz7IngIX9/ITSbSlBzH4jWlC/R6p9vEV6Jgdf9C0
         5Emz7OuXWad5cBHwRyCzbSZxz9XD2oebkMu8lrGxrkPzoNIMFAL9fDmfCJ76LSrJuBHr
         wup20so3EEjqX4oyRZ/1WLB7EM5A48bwK4v1WJUGDUi4p5at584BrzY2At3T0tu67C6O
         Z0Lw==
X-Gm-Message-State: AOJu0Yw6BDdqxaXzZJtIxQq3bRpx0nlHk+vpQ/rEKqV4BshxJH75yeh8
	N/MwZ2uSS9ArrN1/DBz9vPKIOD9wFJri1FxJ0sKWww==
X-Google-Smtp-Source: AGHT+IFDs94V/aDo55pKyEF+KYMg17r2BTEWfhXQjYPz6s8btDK4mBkRCwVsJWRGGrp60X5u0qqqHYxCDBabIc6c5JU=
X-Received: by 2002:a67:cd11:0:b0:450:8e58:2de4 with SMTP id
 u17-20020a67cd11000000b004508e582de4mr18396034vsl.7.1697021679643; Wed, 11
 Oct 2023 03:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com> <2023101048-attach-drift-d77b@gregkh>
 <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com> <2023101105-oink-aerospace-989e@gregkh>
In-Reply-To: <2023101105-oink-aerospace-989e@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 16:24:28 +0530
Message-ID: <CAK9=C2V3VzCgaJ_dWExvS3mf3QRgeV5tU9t3LsMaHv7xO3wwzA@mail.gmail.com>
Subject: Re: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_035442_856123_17B7724E 
X-CRM114-Status: GOOD (  36.56  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTI6NTbigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDExLCAyMDIz
IGF0IDEyOjAyOjMwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAx
MCwgMjAyMyBhdCAxMDo0NeKAr1BNIEdyZWcgS3JvYWgtSGFydG1hbgo+ID4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBPY3QgMTAsIDIwMjMg
YXQgMTA6MzU6MDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiBUaGUgU0JJIERC
Q04gZXh0ZW5zaW9uIG5lZWRzIHRvIGJlIGVtdWxhdGVkIGluIHVzZXItc3BhY2UKPiA+ID4KPiA+
ID4gV2h5Pwo+ID4KPiA+IFRoZSBTQkkgZGVidWcgY29uc29sZSBpcyBzaW1pbGFyIHRvIGEgY29u
c29sZSBwb3J0IGF2YWlsYWJsZSB0bwo+ID4gS1ZNIEd1ZXN0IHNvIHRoZSBLVk0gdXNlciBzcGFj
ZSB0b29sIChpLmUuIFFFTVUtS1ZNIG9yCj4gPiBLVk1UT09MKSBjYW4gcmVkaXJlY3QgdGhlIGlu
cHV0L291dHB1dCBvZiBTQkkgZGVidWcgY29uc29sZQo+ID4gd2hlcmV2ZXIgaXQgd2FudHMgKGUu
Zy4gIHRlbG5ldCwgZmlsZSwgc3RkaW8sIGV0YykuCj4gPgo+ID4gV2UgZm9yd2FyZCBTQkkgREJD
TiBjYWxscyB0byBLVk0gdXNlciBzcGFjZSBzbyB0aGF0IHRoZQo+ID4gaW4ta2VybmVsIEtWTSBk
b2VzIG5vdCBuZWVkIHRvIGJlIGF3YXJlIG9mIHRoZSBndWVzdAo+ID4gY29uc29sZSBkZXZpY2Vz
Lgo+Cj4gSGludCwgbXkgIldoeSIgd2FzIGF0dGVtcHRpbmcgdG8gZ2V0IHlvdSB0byB3cml0ZSBh
IGJldHRlciBjaGFuZ2Vsb2cKPiBkZXNjcmlwdGlvbiwgd2hpY2ggd291bGQgaW5jbHVkZSB0aGUg
YWJvdmUgaW5mb3JtYXRpb24uICBQbGVhc2UgcmVhZCB0aGUKPiBrZXJuZWwgZG9jdW1lbnRhdGlv
biBmb3IgaGludHMgb24gaG93IHRvIGRvIHRoaXMgc28gdGhhdCB3ZSBrbm93IHdoYXQKPiB3aHkg
Y2hhbmdlcyBhcmUgYmVpbmcgbWFkZS4KCk9rYXksIEkgd2lsbCBpbXByb3ZlIHRoZSBjb21taXQg
ZGVzY3JpcHRpb24gYW5kIGNvdmVyLWxldHRlci4KCj4KPiA+ID4gPiBzbyBsZXQKPiA+ID4gPiB1
cyBmb3J3YXJkIGNvbnNvbGVfcHV0cygpIGNhbGwgdG8gdXNlci1zcGFjZS4KPiA+ID4KPiA+ID4g
V2hhdCBjb3VsZCBnbyB3cm9uZyEKPiA+ID4KPiA+ID4gV2h5IGRvZXMgdXNlcnNwYWNlIGhhdmUg
dG8gZ2V0IGludm9sdmVkIGluIGEgY29uc29sZSBtZXNzYWdlPyAgV2h5IGlzCj4gPiA+IHRoaXMg
bmVlZGVkIGF0IGFsbD8gIFRoZSBrZXJuZWwgY2FuIG5vdCBoYW5kbGUgdXNlcnNwYWNlIGNvbnNv
bGVzIGFzCj4gPiA+IG9idmlvdXNseSB0aGV5IGhhdmUgdG8gYmUgcmUtZW50cmFudCBhbmQgaXJx
IHNhZmUuCj4gPgo+ID4gQXMgbWVudGlvbmVkIGFib3ZlLCB0aGVzZSBhcmUgS1ZNIGd1ZXN0IGNv
bnNvbGUgbWVzc2FnZXMgd2hpY2gKPiA+IHRoZSBWTU0gKGkuZS4gS1ZNIHVzZXItc3BhY2UpIGNh
biBjaG9vc2UgdG8gbWFuYWdlIG9uIGl0cyBvd24uCj4KPiBJZiBpdCBjaG9vc2VzIG5vdCB0bywg
d2hhdCBoYXBwZW5zPwoKSWYgS1ZNIHVzZXItc3BhY2UgY2hvb3NlcyBub3QgdG8gaGFuZGxlIFNC
SSBEQkNOIGNhbGxzIHRoZW4gaXQgY2FuCmRpc2FibGUgU0JJIERCQ04gZXh0ZW5zaW9uIGZvciBH
dWVzdCBWQ1BVcyB1c2luZyB0aGUgT05FX1JFRwppb2N0bCgpIGludGVyZmFjZS4KCj4KPiA+IFRo
aXMgaXMgbW9yZSBhYm91dCBwcm92aWRpbmcgZmxleGliaWxpdHkgdG8gS1ZNIHVzZXItc3BhY2Ug
d2hpY2gKPiA+IGFsbG93cyBpdCB0byBtYW5hZ2UgZ3Vlc3QgY29uc29sZSBkZXZpY2VzLgo+Cj4g
V2h5IG5vdCB1c2UgdGhlIG5vcm1hbCB2aXJ0aW8gY29uc29sZSBkZXZpY2UgaW50ZXJmYWNlIGlu
c3RlYWQgb2YgbWFraW5nCj4gYSByaXNjdi1jdXN0b20gb25lPwoKVGhlIFNCSSBEQkNOIChvciBk
ZWJ1ZyBjb25zb2xlKSBpcyBvbmx5IGFuIGVhcmx5IGNvbnNvbGUgdXNlZCBmb3IKZWFybHkgcHJp
bnRzIGFuZCBib290bG9hZGVycy4KCk9uY2UgdGhlIHByb3BlciBjb25zb2xlIChsaWtlIHZpcnRp
byBjb25zb2xlKSBpcyBkZXRlY3RlZCBieSB0aGUgR3Vlc3QKa2VybmVsLCBpdCB3aWxsIHN3aXRj
aCB0aGUgZGVidWcgY29uc29sZSB0byBwcm9wZXIgY29uc29sZS4KCj4KPiBXaGVyZSBpcyB0aGUg
dXNlcnNwYWNlIHNpZGUgb2YgdGhpcyBpbnRlcmZhY2UgYXQ/ICBXaGVyZSBhcmUgdGhlIHBhdGNo
ZXMKPiB0byBoYW5kbGUgdGhpcyBuZXcgYXBpIHlvdSBhZGRlZD8KCkFzIG1lbnRpb25lZCBpbiB0
aGUgY292ZXIgbGV0dGVyLCBJIGhhdmUgaW1wbGVtZW50ZWQgaXQgaW4gS1ZNVE9PTCBmaXJzdC4K
ClRoZSBwYXRjaGVzIGNhbiBiZSBmb3VuZCBpbiByaXNjdl9zYmlfZGJjbl92MSBicmFuY2ggYXQ6
Cmh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2t2bXRvb2wuZ2l0CgpNb3JlIHByZWNpc2VseSwg
dGhpcyBjb21taXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2t2bXRvb2wvY29tbWl0LzA2
YTM3M2VlODk5MWY4ODJlZjc5ZGUzODQ1YTRjOGQ2M2NiMTg5YTYKCj4KPiA+Cj4gPiA+Cj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNw
dV9zYmkuaCB8ICAxICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
ICAgICB8ICAxICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAg
ICB8ICA0ICsrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jICAg
ICB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICA0IGZpbGVzIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdmNwdV9zYmkuaAo+ID4gPiA+IGluZGV4IDhkNmQ0ZGNlOGE1ZS4uYTg1Zjk1ZWI2ZTg1IDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgK
PiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gPiA+
ID4gQEAgLTY5LDYgKzY5LDcgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0
ZW5zaW9uIHZjcHVfc2JpX2V4dF9pcGk7Cj4gPiA+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3Zt
X3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfcmZlbmNlOwo+ID4gPiA+ICBleHRlcm4g
Y29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3Nyc3Q7Cj4g
PiA+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3Ni
aV9leHRfaHNtOwo+ID4gPiA+ICtleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRl
bnNpb24gdmNwdV9zYmlfZXh0X2RiY247Cj4gPiA+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3Zt
X3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfZXhwZXJpbWVudGFsOwo+ID4gPiA+ICBl
eHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3Zl
bmRvcjsKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ID4gPiBp
bmRleCA5MTdkOGNjMjQ4OWUuLjYwZDNiMjFkZWFkNyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ID4gPiBAQCAtMTU2LDYgKzE1Niw3IEBAIGVudW0gS1ZN
X1JJU0NWX1NCSV9FWFRfSUQgewo+ID4gPiA+ICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX1BNVSwK
PiA+ID4gPiAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9FWFBFUklNRU5UQUwsCj4gPiA+ID4gICAg
ICAgS1ZNX1JJU0NWX1NCSV9FWFRfVkVORE9SLAo+ID4gPiA+ICsgICAgIEtWTV9SSVNDVl9TQklf
RVhUX0RCQ04sCj4gPiA+ID4gICAgICAgS1ZNX1JJU0NWX1NCSV9FWFRfTUFYLAo+ID4gPgo+ID4g
PiBZb3UganVzdCBicm9rZSBhIHVzZXIva2VybmVsIEFCSSBoZXJlLCB3aHk/Cj4gPgo+ID4gVGhl
IEtWTV9SSVNDVl9TQklfRVhUX01BWCBvbmx5IHJlcHJlc2VudHMgdGhlIG51bWJlcgo+ID4gb2Yg
ZW50cmllcyBpbiAiZW51bSBLVk1fUklTQ1ZfU0JJX0VYVF9JRCIgc28gd2UgYXJlIG5vdAo+ID4g
YnJlYWtpbmcgImVudW0gS1ZNX1JJU0NWX1NCSV9FWFRfSUQiIHJhdGhlciBhcHBlbmRpbmcKPiA+
IG5ldyBJRCB0byBleGlzdGluZyBlbnVtLgo+Cj4gU28geW91IGFyZSBzdXJlIHRoYXQgdXNlcnNw
YWNlIG5ldmVyIGFjdHVhbGx5IHRlc3RzIG9yIHNlbmRzIHRoYXQgX01BWAo+IHZhbHVlIGFueXdo
ZXJlPyAgSWYgbm90LCB3aHkgaXMgaXQgZXZlbiBuZWVkZWQ/Cj4KPiB0aGFua3MsCj4KPiBncmVn
IGstaAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=

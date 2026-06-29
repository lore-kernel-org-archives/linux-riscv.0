Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC2C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqB5JLmFQEfmulPq/Elj942xtC1dFXqaRQ/mrbHnyYg=; b=aOCawUFMQRpcl3
	S2vyj9GtR50A3jlfxZxH4fSQA/1UY/3MxaMFk9JJRx7BUyLmGz+oLvfCOmVYzp4Nzjb9oKcoESZQp
	JvaTazZsZf0ynjU+7mChTfeX6FBFA+RCuTYZqItltfW++F8jdgJukDbsQewhDQ1BcDl4dxPWAoj8F
	vZxwT/7fVDKQeABEiTSE12fW6ZhTM2EK77/y8/6il0ZFWIt7GimboF+cTMIov/O8GBX9PUVL/a7lW
	beLucFtiiOGhwsPG7v0W1DDmU3r35Tqo+pDOP9YzhkWCrOBWpmiV8l+UkEed1V/cVw3mfW80xUS8L
	5+GuZy986pr7jQr25zmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIYs-0000000FRjW-2KHX;
	Mon, 29 Jun 2026 20:26:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIYp-0000000FRih-3V2v
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 20:26:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so15854355e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 13:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782764790; cv=none;
        d=google.com; s=arc-20260327;
        b=YGhsZ+DO3uQyPKmKz55YshpIfgsF69Ztn3zbe/9zLzZggcK7IF8KwBNTGmHzRskSav
         +cnZn2o7U2qgTyslhvChofQA87CIZCRhqjNPgyl59jk6AsiYgN1VWR46FeeiOVy/qtYY
         pJWIHb6YwljQLZldvTVc9IBBgCGoYDb1lsUUTQJaBS8Ae5qHFPn4ucYF8bgRi9MbVvsv
         ACqszGvz0DcP04FVH/tDkUOBzlwEz4p26qJZ7bRWaymvUmM1E4whN8RrZ1S4Nlm+m2zk
         KJlt1xLWYtA1xVveTixiwcL3Oq3G0f9vCXA8lwL6y2JrPtx4I1HzqM3qeWDQtp/t54fd
         8kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDrF/yyIMpS6ZA2Riz+vcoNoOC8Zd0lhJXN7Go9GtGA=;
        fh=121pBNlIYpaATOHfeT270cXF7LLPkjosLg6KzFU8c8s=;
        b=gn0PqzYB59qeUecfBRbJXwfItbXzbD7DiTohd5e2+AL4B/bJ/+Ly9LqBzm+fKdthyL
         Zhrdni2AQjlI+vdMsbWgcJcLjzG2byujTkYCKoNeFuyYwtOw+y5MeUilKbxr7KSorzQY
         CRRG6JmgjcrHLKqdN+fE+1jHQ/j4LDW8BgUoKkfPBvrJ5yu+jWq/EXFPhy52NLjgIteG
         pvEXtY3FRCiq/GNQuixm4diGxuXObIdwca5oNTyzDf4UDFMPL8L6Z9kQMiGc+O7Jk2ZX
         W/YFPBksI9aZMAbdw6a3MK4GTkIDwE1IpzJHnZxNq8UI/fwCfVBbGodUY5AtWQD6p+pg
         aD6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782764790; x=1783369590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDrF/yyIMpS6ZA2Riz+vcoNoOC8Zd0lhJXN7Go9GtGA=;
        b=gaASTPEOEdpEDHDivDBFWb1jD2wuXd+M9Rw4Eq+PbBvixDOBLtdW68jVr1pN+4Mwei
         RD5UiYvCFIkS9AaW8ADL+nCdKSRVypONPKnc+Q7gGHjoYuou8dGLtX9HCALuGu3MAQ4F
         SBSrIm3PFdAGsxOFHTm98VjbLiPeB6bLplwBvSfSdf9mqsuFIPLh6izNxz2ysyKP0Bcx
         7ghoj8wvUAtjWdDAWyjHhAa1PCH+Xsvg225osWIRFakaT1SjRTEt4Ics4y47YAa46ERn
         WfVYJMmjXcQIOOCTZ0KTyFKMxbMvMZ4gQ/MRWCoiD+jSUIOiBE+42CSO9hD2JGx0ZvD8
         mOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764790; x=1783369590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDrF/yyIMpS6ZA2Riz+vcoNoOC8Zd0lhJXN7Go9GtGA=;
        b=lYYpJBbjDaPG9zeO6bb4yfvCU+T0ZCBYJHnY+GafRCjlVD/E8jj/c/OwG02gIrqUVk
         3MYbU3wxhFFSt8QZnDKhxFBPKgPXbUj7innnfkHXM2QoncjwSh0wIdU5DDEGZnUsqtbj
         YIN50fhpREep0XkhBli8eBMM2d960bqzwQeknEkePCXJEO1oVffAu64GYn/BHAicq08Y
         DOfv6vfuG4HxCNGoAMmBMcqxtQuCYm9TEI0krIc3u2sSRAQGvxAMRCbnleJIX4gXaMwJ
         nfRPaFimgQVLI7Jr+MdlqUizMNuG0DXd66vf0JNRHSbpJxu029kr3YNy8DamUV0bEJVl
         B2wA==
X-Forwarded-Encrypted: i=1; AFNElJ9NnaKeMQYz+/VTheFrvb/+dyurtouDYg144RNvq/mUd375Bv842z6Lwg3lTStJ5jCyvO8Bzf5f/miPhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi5zZ6BUikjYPyA5X9DX7WJz5Rk34ADPlW+AweOuQYjGKM6WYa
	T1dCArUzZQG4i/DfBD43qetascVjBx7SmM621S2Efrqc3xoIhgd6NoHPnzuPwqU1gDVpsmEE/BJ
	jptB53sO4qn5wjSdjA6cMrVrSbMmWlBw=
X-Gm-Gg: AfdE7clewqPEv4ka8lDZP0Ks0kwwfbMt1RVtjxeA218Ev+wqTw+LFac0zZWhBWU/myG
	znA4Mpe0i/kTLVncnwsfP7v/xIrVhJe6oOKSRv8sKWm2z+RZ+WvZXyprWMecImnrfBeCo6XMTCY
	2QmWGOzzDxc6uHLqJsbJHhUkdBBPO4G8Twm8z9Ps21rprPhPM5nnxVQKIEFjISoe5XStyVQnx4L
	VIQZNhHvE3paAhVFbDlfY1VXuKDZNaZkv1Pfag2Gg5kWQfPzUXlTUPAHtYXNHiHsIa0Hj4do1/C
	Zd7UfpDGsMZnSRYjqJQFMJXcX7Yc9hRqf0sbCMrj
X-Received: by 2002:a05:600c:2307:b0:47d:52ef:c572 with SMTP id
 5b1f17b1804b1-493b8c362f0mr8930275e9.1.1782764789542; Mon, 29 Jun 2026
 13:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com> <20260621-riscv_insn_table-v2-8-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-8-7f0810ee2274@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 29 Jun 2026 16:25:53 -0400
X-Gm-Features: AVVi8CfcJ5_Gyn04QD1uaVCzrs31IcTfWuPBgWH8Bbn0CKPr59m0ofaAdOQj3Go
Message-ID: <CAJFTR8T33Yw-wqPFVLe8it2cWjXCz_xPpRCRmoVMQyn7_=UBqw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] riscv: kvm: Use generated instruction headers
 for csr code
To: thecharlesjenkins@gmail.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Nam Cao <namcao@linutronix.de>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_132631_925589_E523BB10 
X-CRM114-Status: GOOD (  21.30  )
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

T24gTW9uLCBKdW4gMjIsIDIwMjYgYXQgMTowOOKAr0FNIENoYXJsaWUgSmVua2lucyB2aWEgQjQg
UmVsYXkKPGRldm51bGwrdGhlY2hhcmxlc2plbmtpbnMuZ21haWwuY29tQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gRnJvbTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5j
b20+Cj4KPiBNaWdyYXRlIHRoZSBjc3IgcGFyc2luZyBjb2RlIHRvIHVzZSB0aGUgZ2VuZXJhdGVk
IGluc3RydWN0aW9uIGhlYWRlcnMKPiBpbnN0ZWFkIG9mIHRoZSBoYW5kLXdyaXR0ZW4gaW5zdHJ1
Y3Rpb24gY29tcG9zaXRpb24gZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBK
ZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+Cj4KPiAtLS0KPgo+IFRoaXMgaXMg
YSBzaW1wbGUgdHJhbnNmb3JtYXRpb24gdGhhdCBJIGhhdmUgYWdhaW4gdmFsaWRhdGVkIHRocm91
Z2gKPiBicnV0ZSBmb3JjZS4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgfCA0
NyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5z
bi5jCj4gaW5kZXggZjA5ZjkyNTFkMWYwLi44Y2NmNmVjNzIyZjAgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24u
Ywo+IEBAIC0xNDYsNDMgKzE0Niw0NCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfY3NyX3JldHVybihz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pCj4KPiAgc3RhdGljIGlu
dCBjc3JfaW5zbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sIHVs
b25nIGluc24pCj4gIHsKPiArICAgICAgICNkZWZpbmUgR0VUX1JFRyhfcmQpICgqKCh1bnNpZ25l
ZCBsb25nICopKCZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQpICsgX3JkKSkKPiArCgpJTU8gaXQg
d291bGQgYmUgYmV0dGVyIHRvIG1ha2UgdGhpcyBhIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24sIG90
aGVyd2lzZS4KClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8anRhdWJlcGVAcmVkaGF0LmNvbT4K
Cj4gICAgICAgICBpbnQgaSwgcmMgPSBLVk1fSU5TTl9JTExFR0FMX1RSQVA7Cj4gLSAgICAgICB1
bnNpZ25lZCBpbnQgY3NyX251bSA9IGluc24gPj4gU0hfUlMyOwo+IC0gICAgICAgdW5zaWduZWQg
aW50IHJzMV9udW0gPSAoaW5zbiA+PiBTSF9SUzEpICYgTUFTS19SWDsKPiAtICAgICAgIHVsb25n
IHJzMV92YWwgPSBHRVRfUlMxKGluc24sICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQpOwo+ICsg
ICAgICAgdW5zaWduZWQgaW50IGNzcl9udW07Cj4gICAgICAgICBjb25zdCBzdHJ1Y3QgY3NyX2Z1
bmMgKnRjZm4sICpjZm4gPSBOVUxMOwo+ICAgICAgICAgdWxvbmcgdmFsID0gMCwgd3JfbWFzayA9
IDAsIG5ld192YWwgPSAwOwo+Cj4gICAgICAgICAvKiBEZWNvZGUgdGhlIENTUiBpbnN0cnVjdGlv
biAqLwo+IC0gICAgICAgc3dpdGNoIChHRVRfRlVOQ1QzKGluc24pKSB7Cj4gLSAgICAgICBjYXNl
IEdFVF9GVU5DVDMoSU5TTl9NQVRDSF9DU1JSVyk6Cj4gKyAgICAgICBpZiAocmlzY3ZfaW5zbl9p
c19jc3JydyhpbnNuKSkgewo+ICAgICAgICAgICAgICAgICB3cl9tYXNrID0gLTFVTDsKPiAtICAg
ICAgICAgICAgICAgbmV3X3ZhbCA9IHJzMV92YWw7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+
IC0gICAgICAgY2FzZSBHRVRfRlVOQ1QzKElOU05fTUFUQ0hfQ1NSUlMpOgo+IC0gICAgICAgICAg
ICAgICB3cl9tYXNrID0gcnMxX3ZhbDsKPiArICAgICAgICAgICAgICAgbmV3X3ZhbCA9IEdFVF9S
RUcocmlzY3ZfaW5zbl9jc3Jyd19leHRyYWN0X3hzMShpbnNuKSk7Cj4gKyAgICAgICAgICAgICAg
IGNzcl9udW0gPSByaXNjdl9pbnNuX2NzcnJ3X2V4dHJhY3RfY3NyKGluc24pOwo+ICsgICAgICAg
fSBlbHNlIGlmIChyaXNjdl9pbnNuX2lzX2NzcnJzKGluc24pKSB7Cj4gKyAgICAgICAgICAgICAg
IHdyX21hc2sgPSBHRVRfUkVHKHJpc2N2X2luc25fY3NycnNfZXh0cmFjdF94czEoaW5zbikpOwo+
ICAgICAgICAgICAgICAgICBuZXdfdmFsID0gLTFVTDsKPiAtICAgICAgICAgICAgICAgYnJlYWs7
Cj4gLSAgICAgICBjYXNlIEdFVF9GVU5DVDMoSU5TTl9NQVRDSF9DU1JSQyk6Cj4gLSAgICAgICAg
ICAgICAgIHdyX21hc2sgPSByczFfdmFsOwo+ICsgICAgICAgICAgICAgICBjc3JfbnVtID0gcmlz
Y3ZfaW5zbl9jc3Jyc19leHRyYWN0X2NzcihpbnNuKTsKPiArICAgICAgIH0gZWxzZSBpZiAocmlz
Y3ZfaW5zbl9pc19jc3JyYyhpbnNuKSkgewo+ICsgICAgICAgICAgICAgICB3cl9tYXNrID0gR0VU
X1JFRyhyaXNjdl9pbnNuX2NzcnJzX2V4dHJhY3RfeHMxKGluc24pKTsKPiAgICAgICAgICAgICAg
ICAgbmV3X3ZhbCA9IDA7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgY2FzZSBH
RVRfRlVOQ1QzKElOU05fTUFUQ0hfQ1NSUldJKToKPiArICAgICAgICAgICAgICAgY3NyX251bSA9
IHJpc2N2X2luc25fY3NycmNfZXh0cmFjdF9jc3IoaW5zbik7Cj4gKyAgICAgICB9IGVsc2UgaWYg
KHJpc2N2X2luc25faXNfY3NycndpKGluc24pKSB7Cj4gICAgICAgICAgICAgICAgIHdyX21hc2sg
PSAtMVVMOwo+IC0gICAgICAgICAgICAgICBuZXdfdmFsID0gcnMxX251bTsKPiAtICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gLSAgICAgICBjYXNlIEdFVF9GVU5DVDMoSU5TTl9NQVRDSF9DU1JSU0kp
Ogo+IC0gICAgICAgICAgICAgICB3cl9tYXNrID0gcnMxX251bTsKPiArICAgICAgICAgICAgICAg
bmV3X3ZhbCA9IHJpc2N2X2luc25fY3NycndpX2V4dHJhY3RfaW1tKGluc24pOwo+ICsgICAgICAg
ICAgICAgICBjc3JfbnVtID0gcmlzY3ZfaW5zbl9jc3Jyd2lfZXh0cmFjdF9jc3IoaW5zbik7Cj4g
KyAgICAgICB9IGVsc2UgaWYgKHJpc2N2X2luc25faXNfY3NycnNpKGluc24pKSB7Cj4gKyAgICAg
ICAgICAgICAgIHdyX21hc2sgPSByaXNjdl9pbnNuX2NzcnJ3aV9leHRyYWN0X2ltbShpbnNuKTsK
PiAgICAgICAgICAgICAgICAgbmV3X3ZhbCA9IC0xVUw7Cj4gLSAgICAgICAgICAgICAgIGJyZWFr
Owo+IC0gICAgICAgY2FzZSBHRVRfRlVOQ1QzKElOU05fTUFUQ0hfQ1NSUkNJKToKPiAtICAgICAg
ICAgICAgICAgd3JfbWFzayA9IHJzMV9udW07Cj4gKyAgICAgICAgICAgICAgIGNzcl9udW0gPSBy
aXNjdl9pbnNuX2NzcnJzaV9leHRyYWN0X2NzcihpbnNuKTsKPiArICAgICAgIH0gZWxzZSBpZiAo
cmlzY3ZfaW5zbl9pc19jc3JyY2koaW5zbikpIHsKPiArICAgICAgICAgICAgICAgd3JfbWFzayA9
IEdFVF9SRUcocmlzY3ZfaW5zbl9jc3Jyd2lfZXh0cmFjdF9pbW0oaW5zbikpOwo+ICAgICAgICAg
ICAgICAgICBuZXdfdmFsID0gMDsKPiAtICAgICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICBk
ZWZhdWx0Ogo+ICsgICAgICAgICAgICAgICBjc3JfbnVtID0gcmlzY3ZfaW5zbl9jc3Jyd2lfZXh0
cmFjdF9jc3IoaW5zbik7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7Cj4gICAgICAgICB9Cj4KPiArICAgICAgICN1bmRlZiBHRVRfUkVHCj4gKwo+ICAgICAg
ICAgLyogU2F2ZSBpbnN0cnVjdGlvbiBkZWNvZGUgaW5mbyAqLwo+ICAgICAgICAgdmNwdS0+YXJj
aC5jc3JfZGVjb2RlLmluc24gPSBpbnNuOwo+ICAgICAgICAgdmNwdS0+YXJjaC5jc3JfZGVjb2Rl
LnJldHVybl9oYW5kbGVkID0gMDsKPgo+IC0tCj4gMi41NC4wCj4KPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

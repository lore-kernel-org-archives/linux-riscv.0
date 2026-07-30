Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C52C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS4f/HaAJCPg+pC5M15cFo0F19H5Yx23jQNuGSSDkzc=; b=F5lGV1hfkSPHXL
	Mgb3eTKRi+eW/LzAFiX82sghKpNYoZcMkGatr/clSbzn5qqzR8cEg1W6WAqdYBA5MHlGNlspyHAjg
	fmvDNNe95ECdPIE/0vOK6ztNyaNGCE96TefkW+ty3dM7G0vxzyGSJIxcBVDy3CKttymDft3HtQvkz
	yxfdgHQd2qriqrxOIywi2ZG/aYbbggQKMRPRx9Dhbd9/XiCO6eKCzcuDwUt2LI05gkR1oo4LhzI5M
	UhXmuA1qnHTQS8A2DaGDuk+Yx+BIISldInN2U7QS9GcMtbNHrbDweAjNDZojZhelxiksCi8teFMge
	uMuTK6Shl5JmbHEe5UTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKNg-00000009dCM-3wxz;
	Thu, 30 Jul 2026 06:36:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKNd-00000009dBV-3dpC
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:36:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47db714766aso216729f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785393392; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9zSEki3/G0gjIqvNKLHNaSR8tmOm6AsfwrPbV/9hquUN605y3+MVXbxnXnzcoRP7o
         9h4VuY7EoXS3HkaXldlqVj2WPonDG8QbCAVbLMVuq+nk0r1CV1cBq70Tvnl0lccqKzOt
         GJApXNpmZNeMSUy7hmcCA0FHMK2rOtfUMhe6MtgRkZ5LU+YdQ35U21GNvKK1eWLzOySO
         K/5jymnaSvXex8L18rjhv2kaRkah0CfFWnq38FPsGD2EGublwONF7z1L6HLiwcwDS/UC
         XrwUzwuBJyixN2xEwfQ3RlqYppuTNFYD8zjq4hTQdQgWZUfuHJVY9wf13XHn7pPL3luf
         iN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qTmettx8cBsuN1BktqpKr41TwEVmMBQwm8x7EG1kBB4=;
        fh=w5Tj+bttd4AaqQ1PzSulil44V56SbHrVSXVfnrCbt24=;
        b=nskEk6ozKLm+75JeY7JA+gZSGGH21P5rTQJ3bkqT7s71D6H01eLAob/aURH5tG+30t
         WRREMZJ1mi64/HNAB43Qat0Soh6m/MU8hEJBKOHZTBsXpY9D/fIThm6II9G6QCwQKgz9
         ywZoPk7gRWQs9xPLd1TKivlIdds1W+pIOskgfDcWmVrxYz84h3t4n6QDJz+SQcyt6Zex
         4RfxpgASLEYC5/OuWaydKJDBztgRr1yoEAOcSWa1A+s3k2WnkvRaHQLhiSZae2jwjucI
         PqL5zVEJXL05DtZEvrp2TnKUNrsgh/ZMOJ8PdF7UMIMmkM+bj35QMqT54esCfCZzc2kb
         muTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785393392; x=1785998192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qTmettx8cBsuN1BktqpKr41TwEVmMBQwm8x7EG1kBB4=;
        b=kjTVwpAs1A55XyI2RFNuA9BlRsA645tl5GttoJwRIq8hBU+ZpRMKch+yehcV+psDq1
         lsfjJlnr60O6scW/eb4SCkKIGtqfplk2g3KWXiEWBpo6ZZbpmg9epITaRazWVY026qvh
         lS0gpqGU411OioAuUnAik8k4RqbnpYebM38l2pMpC8gViJGltbA62ZHIY01oh0Oq+uwJ
         s8dJogz40/G830lim1Jfy8/PpvfIHF7b2vq0OYOwYNbTvJogKkw//E27U8cGAB2xbzsE
         VuitOMESyKohxXzEuZGG6igZ2HsIj3xgPcWn1LEfYcUKJAg7QfMjfLMr+oCUef+i5Ark
         YMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393392; x=1785998192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTmettx8cBsuN1BktqpKr41TwEVmMBQwm8x7EG1kBB4=;
        b=T6nbKskt2DVI9O8R6DZMVmRDuxCUx/yvV+Llfq+TUfziSQjuQMemJwuUw20I7tf0Kq
         czlD7684Q1l6DQfh75HifG3jIc/ybL7yeumBnk6eLOPHJQeaU55ppimwvG3eb+0Uwnm2
         /Pb+Od4/7WsieERGvgImZXPOaGOSAC4KyudC0D8Bu3eiIqKWYroC6GjADdhxneDWwGvd
         k1+IWj4q69oIOiaQ6QZ8ue/GIx69M8g9zAYUvJdGpuvyo2GUWl77JMW7vYByZkMEHKRW
         r6d4PSwQrvHOgNvUaFxeWifAXW7XizSTLMEQ15ET0kKzX0fJzbcQ+K38SaF1gRwuKcC1
         EJ0g==
X-Forwarded-Encrypted: i=1; AHgh+RrVBieWLGdhaHWxkZjYF/7BYtaK3VjvMe6pMlHFpxpemAILfcNd56C2YKBdt/EUGAMyBNhAG2H7xrZJIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuj6K/qPMNh1QeRF5MnPYBQbvAkS5g4qQee+0841FhVvqWHBM4
	5owCEyE6dtEhQYyYwXpRNMwP/x5TDzqo4M79gErwuWGoq6vEnkOt18iNybUGs565VOoQXrF2IZ7
	C0HdCY7N7d+dd8Q4KKmpM//6Dl9iYGC4IqNItLT9NGQ==
X-Gm-Gg: AR+sD11UnORazGKUS1VZoT0S1XiTlPATocxi9LqdIVhJOMUIxj6CZ1uMBBMAQJtouBo
	Zg2kaXheI+EmbzkoAnIIEdrOpySHhHRNcygooS7DH/B9vZP3R5WYktFXZlSLmZWOWKdOXrbeDJH
	ZBi8VUeu+VpelmFc+9jEpOZFCjJm8HcMvLonLrc4M79E8aCFFRM5QMVzzmsjvqIKaOku8e4q8N5
	EwzQSexSWy784fc/nL5cYPMgN5I4IXOBJITuJxbi09BWMJNyMtGwD0we6RmFWL7/SF8ZtYtKQLy
	XkqYny8Uacz01RoGjp2PaPVR7ITfVQqK76o+4kFK5HJM98KosEtwThv2vmeYPZj6ot1XnqUpl0t
	HF6T2Nwm9vyYMk3M6A62AEcNCxHLJwv0gRXTdfXcd+HUETFeB/yI9YtFDNMfO/Vc=
X-Received: by 2002:a5d:588f:0:b0:475:da0e:744d with SMTP id
 ffacd0b85a97d-47fc8bd9a17mr1123969f8f.8.1785393391373; Wed, 29 Jul 2026
 23:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260729232527.139183-1-inochiama@gmail.com> <20260729232527.139183-5-inochiama@gmail.com>
In-Reply-To: <20260729232527.139183-5-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jul 2026 12:06:18 +0530
X-Gm-Features: AUfX_myMCEfrPFgw6hpa1bzA5HZDULLUkMJkPLOpIjbzM3NJsjXgJbt-fDAUHQY
Message-ID: <CAAhSdy3mzKDCy1zEpB7K7qJHG_mUThUu_bXwD+n+RjONPvtS3w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: KVM: Mark the reset callback of FWFT
 extension always dirties CSR
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_233633_925565_D752ECCC 
X-CRM114-Status: GOOD (  14.25  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgNDo1NeKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQXMgdGhlIENTUiBpcyBvbmx5IGZsdXNoZWQgd2hlbiB0
aGUgY3NyX2RpcnR5IGlzIHNldCwgYWx3YXlzIHNldCB0aGUKPiBjc3JfZGlydHkgZmllbGQgaW4g
a3ZtX3NiaV9leHRfZndmdF9yZXNldCgpIHNvIHRoZSBDU1IgY2hhbmdlIGNhbiB0YWtlCj4gZWZm
ZWN0IGltbWVkaWF0ZWx5LiBUaGlzIHVuY29uZGl0aW9uYWwgc2V0IHNob3VsZCBiZSBzYWZlIGFz
IGFsbAo+IHN1cHBvcnRlZCBGV0ZUIGZlYXR1cmVzIGNoYW5nZSB0aGUgQ1NSIHN0YXRlIGN1cnJl
bnRseS4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5j
b20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X2Z3ZnQuYwo+IGluZGV4IDU2ZmI1OWFmZTAyYS4uMmUzNWU3ZTEyMzI3IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2Z3ZnQuYwo+IEBAIC02MDEsNiArNjAxLDggQEAgc3RhdGljIHZvaWQga3ZtX3NiaV9l
eHRfZndmdF9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIGlm
IChmZWF0dXJlLT5yZXNldCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBmZWF0dXJlLT5yZXNl
dCh2Y3B1KTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICB2Y3B1LT5hcmNoLmNzcl9kaXJ0eSA9
IHRydWU7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBrdm1fc2JpX2V4dF9md2Z0X3ZhbGlkYXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAtLQo+IDIuNTUuMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

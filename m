Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4F3606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2u21q/aE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPkG8bpQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=krmuOleLPk2b0i8y/w8dK3XC13YhfXWai7GQCL9lahI=; b=2u21q/aEnbEnOCcsYbGg1YT1dP
	s6sGhKpdbz4VPuqcePPji5HA7s8J/HJp99DPhcwe6nMTDUNEqepPC5XF3evkbiMQUO/liizuY5yyX
	MTjPTEPR82koNAXML/k1Wc7oOSuD3gd9hs511GgOchP1eWDa8qMMIJbN3zgEx1BYBrnkUkHQFdFSh
	102j/A34ximlK3D/VksBV+HM8iibOsSH8oY3Fv/uSAZbIAdDllk1yAjpqkWraoiFePRmYNuGnoo2G
	L+PXE0foHuKM33QBklRikVlPRSrG9IzhnTnjh/FApbAWZA9z/o1UVrkuW2o7R7r8EktYbvP3mwh9+
	03pNRH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2Q1-00000000qIt-18J1;
	Sun, 22 Nov 2026 07:55:25 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2Px-00000000qIW-3Uas
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 07:55:23 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b0dba37a7fso17460987b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 23:55:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795334120; cv=none;
        d=google.com; s=arc-20260327;
        b=mC6XT0yVM7cYWtTJVZVZ9EM/HoWGNvtOQN+m3hwly60U89CAXNvOTqXdnrX1ZhNjkq
         onFgVpi4GLTw29LnSNmwQT51ThXts/dRRzCqmtDZQyd4FM0AojNPNLaILdBb7qx1BXKu
         bE+qdEBbot4QM8tA4L8PLWinKt+wSYAAsSdlwmMAMHmFz5XJ78mOsTQ1LLqYoKICPkWW
         zIG+icrkqOs4QXuzVoUNt4AWsanN8Hui6xOWmbcs4xAYJyok/LOv/F6zOFVFBJzbdiMq
         egu1uxzxCWfAAgC/thi/f8KtHL1vEpgnIGxYlXUNj18DT6zBwlkhm510pH3VBU11WO0g
         Xwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
        fh=zYaMY6QCBx3y9sqPHNp2PTUTLL6vHRL3V/5GgT/9E+0=;
        b=WfqY8WDhQRyGLxQVwWtJQ0YtCSs1y8VXq3SGiQtzEWzIr7UhkqpM6bh+fp1d8m6Yhi
         tbgkyHB44A1+w0+rkxbcy91ztGdj69N2FwTHSRq1i6IEHB4gS+08Nt/5nn57k+t7rLcD
         RrZ1la4HecE/vXr/OKjh2gA+agpd3Hypl23weiHtkhUrZTN+4zNwp28xuSohT8Z8adrC
         Kr/F6QspgAd57fneccU5u71ggmmP8dQBSawUasGibkXcS0WaKhudLbNhclG9WqU3kEe3
         TFsokF/jLLPtdAqrMkfgJdjfXsd+NcX40i7UYsa7EO6r9Npno6/03d9wvxLv111Fxdi5
         ta1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334120; x=1795938920; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
        b=OPkG8bpQxSw6FDX4C8EEs0iKkXf2XtKN37JkwE3TqXkpFPd+eQR7krhtB8NGcdVr5s
         G9XaUlldE4TU11SjEPN0LI+cDj7m+Xv75j1V7dPk5iQzwyb61dT4arQstLwFlcYZxZ2I
         p6MY2tDM+x/l8atm7w4DjnCvjKkf8CdOP9mC2UMgB9R6aWf/ItP+A4nv/DOfiocF1peF
         f3AG04gzORXAe3LFbx+TZjU1HRMKVIItCNQugBhPagW4gJNFRNhEM4NT5OwFL1YaHYhN
         h9rhhvTDCPmO6KkIxHcgfScePsVhI4yZV47VQcl4Sg3jYb8Kgcp4o8uq7rh6H9dpqgCP
         ANCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334120; x=1795938920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdeshsNcFSymLEnyYgGQ3YuhLZb8c16ueubDFBPinGo=;
        b=2lU0xaWtUghbDnlzTLpmP6I7vkxADeylvor2YwpcsQCNABuaZxd4dvdYhzNL0RIKRz
         N4X1zADeLMpNeD3As/Sn1+5wCEUF64zptLr4Dgg/o44hI2n7C6VuAw0panW865kVWRHG
         d9u4pJeoi5rOU5Zjvh2gm/Q1iSIhNb86o0SF5fG+ep7/1U9DWPWF4d2iEseFNDbnHl+L
         RNap85HEFOnyG21V+pizWNPqxNUv4EPr9vhgVkIk1+dcx9mPvJEDj+kpWrlcjMUy9idH
         8jPO60JLLxBMmsiIJCkWHzmVV2g1LwsFWzs7IzEwxz8ikzMHHJO4SRp2Pl+1pHlXR9RN
         yiKQ==
X-Forwarded-Encrypted: i=1; AL+hErE3LxEgdEdmaE+mRhIe9/Gm2iwP3QssO992pV6ME9DOytA+LCJHIsSk5ASDDpaSyRDrYR2ALuxQYpsvGg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Fwu5elQWhMZAXC2OT1AOsFyK2hvBgH4+GVisK+ZoOB5L43ol8
	ndr9KH5tcW3DSEOxALeK4nSNUXtyFXPNGNwU1fQKr0FJWd58KK7Gtc015a0PbRYKETChR3+wB2+
	7eop/BHDJuFH//XiWhPDTrop/wTmWP6M=
X-Gm-Gg: AZFdTZcHj2URgBO5Ca+5G26mvFCvcwYDFtbHavO4XBSWlzF1oPz1A1jP7oM7moxFVfu
	5tBUESwD9aPD2v9adIh13zFVnubXQtaVg2brRO73/eKs96VLBx4sYh7MUKZoLbMx1J1hUpqC80z
	oriL8HLldebrlDBygdRkXmX2eHimh/aVOigbUmE1k2xpzznY2Z6QhISQw02VPf7Fk2Kr1Aih3md
	l2yl/t9wkXQGPIxl4xsLPp2t1uwmvE/BrHphAftxupY/MCdyZezovbEFWJ1PCQMD2DypgKzTZ3G
	jAGBiEVzU4hLWtxtPLiB3S01U+ahqNCmnErfyBCtRNqduBz894/IPEJ/96MwRjlhE5wJnBFZO+H
	pxoNQGZB4AUBg5Wmm3Oub+t7zbR0Oo9H+Poe5tk0=
X-Received: by 2002:a05:690c:b01:b0:8b4:e57d:9421 with SMTP id
 00721157ae682-8b52031b209mr33010807b3.7.1795334120430; Sat, 21 Nov 2026
 23:55:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
In-Reply-To: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 22 Nov 2026 16:55:07 +0900
X-Gm-Features: Aa3M54q1h5hYCprIEwOOOX9ZVBe-G655I8fGo68Sbafor7iQqw7YnSzMQ2bEnTE
Message-ID: <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: drop redundant zeroing of new GEM objects
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_235522_220316_EB42C447 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgR3VpbGxhdW1lLAoKT24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgNjo0M+KAr1BNIEd1aWxsYXVt
ZSBMYSBSb3F1ZQo8Z2xhcm9xdWVAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IHB2cl9nZW1fb2Jq
ZWN0X2NyZWF0ZSgpIGNsZWFycyBldmVyeSBuZXcgb2JqZWN0IHRocm91Z2ggYSBDUFUgbWFwcGlu
Zwo+IHNvIHRoYXQgdXNlcnNwYWNlIG5ldmVyIHNlZXMgZGF0YSBsZWZ0IGJ5IGEgcHJldmlvdXMg
b3duZXIgb2YgdGhlCj4gcGFnZXMgWzFdLiBzaG1lbSBhbHJlYWR5IGd1YXJhbnRlZXMgdGhhdDog
aXQgY2xlYXJzIGVhY2ggcGFnZSBpdAo+IGFsbG9jYXRlcywgYW5kIHRoZSBkbWFfc3luY19zZ3Rh
YmxlX2Zvcl9kZXZpY2UoKSBjYWxsIHRoYXQgZm9sbG93cwo+IG1ha2VzIHRob3NlIHplcm9lcyB2
aXNpYmxlIHRvIHRoZSBHUFUuIFRoZSBzZWNvbmQgcGFzcywgd3JpdGUtY29tYmluZWQKPiBvbiBu
b24tY29oZXJlbnQgZGV2aWNlcywgb25seSBhZGRzIGxhdGVuY3kuCgpJJ20gbm90IHZlcnkgZmFt
aWxpYXIgd2l0aCBzaG1lbSwgc28gSSdkIGxpa2UgdG8gYXNrOiBpcyB0aGlzIHplcm9pbmcKc29t
ZXRoaW5nIHNobWVtIGd1YXJhbnRlZXMsIG9yIGp1c3QgYSBjdXJyZW50IGltcGxlbWVudGF0aW9u
IGRldGFpbD8KClNpbmNlIHRoZSBkcml2ZXIgd291bGQgbm93IHJlbHkgb24gaXQsIGNvdWxkIHlv
dSBzcGVsbCBvdXQgaW4gdGhlCmNvbW1pdCBtZXNzYWdlIHdoZXJlIHRoZSB6ZXJvaW5nIGhhcHBl
bnMgYW5kIHdoeSBpdCBjYW4gYmUgcmVsaWVkIG9uPwoKLS0gClRoYW5rcywKR3lleW91bmcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

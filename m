Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304C8EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsCuKnPkMA6dYK7H8qL1weiUZkcMRTsYkRVSEm/jVWU=; b=NWQPZszR36dJEH
	682vDgZqT699cM2vZZzpNGnXXrlDtB0P55STvtQaOaVeDfNpVFyKUc7adx73AMES6eeR4vdnoARYT
	kYz8KMmN1p4pcxWznsvwWsnJ9QxSX7jzGwxQhNjaWe329ghhl+jqLlFGogx/CSVF3BZ/df7zSPSgl
	+SOu2zjLwFD7T1g3IsMxp+TrLXEavE9j6NAH5L0oA+LXxh8VUc9pxTyR2yfbTaG8kjaCjzC9X2lWd
	nirjx+TyHekPwxbID1T1RVfGh0cBwqU/5jVcXU9iJu0LzxZgXBVgLXYWEiDDEKRyEr6XNFrj4hik9
	nT2k88xSW3XovrOM28OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcOY-0007yp-2n;
	Mon, 14 Aug 2023 18:34:26 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcOW-0007yQ-1w
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 18:34:25 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-40a9918ec08so27992701cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692038063; x=1692642863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUKj6iJDOdjNfGMp7lI4dnhHOH9acY50rwYfnudnhpo=;
        b=yyjNoPJ1bnr/pBFpYTs5oFqSuBiHDB5f/ma5PolZ/uGCezx5LAuR+w19dM5m4N+GdQ
         MqbPPCesXRxORPHYN8P1KDATPaR0A5dbWM3jkQZUqDV0i4ml5pXpODhkhni8l4qJPtAH
         Y7ZjvK6Y4NtFr+VuMgSOu26ashz9BubBGD3LNz4YnAwmuSm5TflJFzsZgNEq4D/5LK8W
         lJSFYrRHStk4KitCsv6J8i/WPUQYs1ANsECz5Oe4OP83kKd2tTD6vQCKx3tkykFYCE+M
         IPCmM+49BbMbOmPR49ABA83qYFmLcozZivBAzSJBcvZ0Z0h/jvpP7O8dXTpgFyBCsTMQ
         kpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692038063; x=1692642863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUKj6iJDOdjNfGMp7lI4dnhHOH9acY50rwYfnudnhpo=;
        b=PcGv/oV/yGPDCQ2Y+bDiNhhJgHBfJNtgXU6KIcbBrZPINCCbnKp/0jKj07J2O7729y
         eMfFmsgC5y9io8pfONMN+zEa0l16rm2m/kUKPbhHF/5SbLVO+NE9pNjD8OsxjNKKzngg
         26oggIDSnVGRLcxjyZ6QoyY1S/vzg0eChHp+VXsIfv1FGuF9VxpukfWik1Ky2mB625Rm
         /DjaVuzf5i9bSkP6bXawdvnaaPWeCUFVJA+InVfXXvktLjBVE/sPDNaK+DPB0rEnAqCN
         LIYe2ZK8pB/hNIPDrYeu8jlVTvCc/lTJVGNtF8dcObMAdoe8N8/BLh9q0ZbwAQuwHsvF
         4F6g==
X-Gm-Message-State: AOJu0YwnrPB5/UybMsGVjR2nqWmjNMZWA+3PhUYD15j/DgnYrqyfxgzu
	/y434sJtxd7CYw/q91Oa0LGGL9NtS/3mHljJiuhnWg==
X-Google-Smtp-Source: AGHT+IFw+hkrZDq2INobHooqEpULo1uNlgRQPVpk9bftXm+RLNziuU6oVDs4NxvKCPomXxDpD4YOCSK/e0K7tdHOzXM=
X-Received: by 2002:a0c:ed22:0:b0:641:8d8c:addd with SMTP id
 u2-20020a0ced22000000b006418d8cadddmr8457092qvq.48.1692038063416; Mon, 14 Aug
 2023 11:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com> <20230814175928.GA1028706@dev-arch.thelio-3990X>
In-Reply-To: <20230814175928.GA1028706@dev-arch.thelio-3990X>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 11:33:46 -0700
Message-ID: <CABCJKufjgT9r_cuRxyth3y_rLPW43OBqtmPB_hQVkSftXUfp=w@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: SCS support
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_113424_642516_C5CA5FCB 
X-CRM114-Status: GOOD (  10.65  )
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMTA6NTnigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEkgdG9vayB0aGlzIHNlcmllcyBmb3IgYSBzcGluIG9u
IHRvcCBvZiA2LjUtcmM2IHdpdGggYm90aCBMTFZNIDE4IChidWlsdAo+IHdpdGhpbiB0aGUgcGFz
dCBjb3VwbGUgb2YgZGF5cykgYW5kIExMVk0gMTcuMC4wLXJjMiBidXQgaXQgc2VlbXMgdGhhdAo+
IHRoZSBDRklfQkFDS1dBUkRTIExLRFRNIHRlc3QgZG9lcyBub3QgcGFzcyB3aXRoCj4gQ09ORklH
X1NIQURPV19DQUxMX1NUQUNLPXkuCj4KPiAgIFsgICA3My4zMjQ2NTJdIGxrZHRtOiBQZXJmb3Jt
aW5nIGRpcmVjdCBlbnRyeSBDRklfQkFDS1dBUkQKPiAgIFsgICA3My4zMjQ5MDBdIGxrZHRtOiBB
dHRlbXB0aW5nIHVuY2hlY2tlZCBzdGFjayByZXR1cm4gYWRkcmVzcyByZWRpcmVjdGlvbiAuLi4K
PiAgIFsgICA3My4zMjUxNzhdIGxrZHRtOiBFZWs6IHJldHVybiBhZGRyZXNzIG1pc21hdGNoISAw
MDAwMDAwMDAwMDAwMDAyICE9IGZmZmZmZmZmODA2MTQ5ODIKPiAgIFsgICA3My4zMjU0NzhdIGxr
ZHRtOiBGQUlMOiBzdGFjayByZXR1cm4gYWRkcmVzcyBtYW5pcHVsYXRpb24gZmFpbGVkIQo+Cj4g
RG9lcyB0aGUgdGVzdCBuZWVkIHRvIGJlIGFkanVzdGVkIG9yIGlzIHRoZXJlIHNvbWUgb3RoZXIg
aXNzdWU/CgpUaGUgdGVzdCBkb2Vzbid0IHdvcmsgb24gUklTQy1WLiBzZXRfcmV0dXJuX2FkZHJf
dW5jaGVja2VkIHRoaW5rcyAweDIKaXMgdGhlIHJldHVybiBhZGRyZXNzLCBzbyBJIGFzc3VtZSB0
aGUgX19idWlsdGluX2ZyYW1lX2FkZHJlc3MgbG9naWMKaXNuJ3QgcXVpdGUgcmlnaHQgaGVyZS4g
S2VlcywgYW55IHRob3VnaHRzPwoKU2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=

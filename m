Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B90BC87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VURZJbW1O35IeI5wgG8vWDu9Lz5Kq5BGMop/joR5Img=; b=CfCaEqewsKBQT5
	SM+1N6aRtbGI910hKwcitVS0f6juhV0Kk4SseAtKKN1aiFu4Hi6xBJ4we3Wzl/Jz1iDZTA9oswkht
	MW+eiRMLbFlvD2v6WbxlIU8DuLJjlAhChK7EhNn4b2kOSCcoUpwPXR15A6f7Fom67lAWyrPhggOgc
	XVFxxQ1fFCU/ph/imYGptOFE+r0TvyD1pJxoCC+VHSUnISvUCWta9qq7+qn2e+oP3h0v7hGh1nrOF
	gRVvxjIMUkzBZO1RGTeRmbuhW8O38z/OugLYBG1UW+sMDeuJ2X0Tdv0qzErlDx4ylFBm0gcU47Uhd
	5Tp9sFzVCdGbRT6JA7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1qt-0000000BIWw-25e1;
	Mon, 04 Aug 2025 20:32:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1qs-0000000BIWp-3Jxe
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC6A2601E4;
	Mon,  4 Aug 2025 20:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F95C4CEE7;
	Mon,  4 Aug 2025 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339529;
	bh=40RPmmhgenS++dUjxETl8DxV/XFXspYQo4HXXmsrhls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JQXUKdMwFWEh72JN1E6XzW9gB6pcSUBn7mgP4hBUHV2TpolWdTSfQw4mCxYy4Zy3E
	 lUtaIyYa44cze8FqCym9EpaeMrWsTATwoH27xF95eprgUJJmuX8DtRZ/QiocXQ8aIA
	 jc4t2gY8jGLgkj3U/lrseTF3ovLDIfeRF/v10YguErQe6smk0ksBMrsbOIRzb55XFY
	 28W/sTdccRNJl6jdGHkTr0BO8ndO2VYz/Ani6KoevoXAVgowgiDbhXZFgVj5gAS4iR
	 Enk6figXDmKEHpnxpASTpbq88kekHHfDpVfBD7xWDRHwvW+N9ywUM1E/OOSiU10oIJ
	 LNeyo9+ssoqnQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 05/10] riscv, bpf: Add rv_ext_enabled macro for
 runtime detection extentsion
In-Reply-To: <20250719091730.2660197-6-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-6-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:32:06 +0200
Message-ID: <87ms8e3k1l.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

Tml0OiBTdWJqZWN0OiBzL2V4dGVudHNpb24vZXh0ZW5zaW9uLwoKUHUgTGVodWkgPHB1bGVodWlA
aHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aS5jb20+Cj4KPiBBZGQgcnZfZXh0X2VuYWJsZWQgbWFjcm8gdG8gY2hlY2sgd2hldGhlciB0aGUg
cnVudGltZSBkZXRlY3Rpb24KPiBleHRlbnNpb24gaXMgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=

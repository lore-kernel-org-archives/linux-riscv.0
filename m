Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A743C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpWmjaccJk/rezONAnHft1FERrkgSwId5zIEqy2iPuA=; b=XoS2R3FLA3iUL5
	hYHuY7rp2F+6qDPhHURqJ8h2+SK/jTVCaX4yYRCdfbEXWqh9hO+IO1LN+IALzx6x0WM3Qb1/elj/Z
	UK17ErmdiPmyGVQz0EobA9HNJ4qt1S9IFB4KZzHckYw3J9Gw2vIQYDOdGd0z0lBL10QSyilcBl0ie
	64ODifKyPIB73oq5hFABIkBhQ4Zjg3EDQZsK/glYq8dicruG5t2dmV9OG0gH0I4pqPUqQwnhc0A02
	m4xp9xnO1G2xRcXCFXlaA7c2VArWA0MyP1o8vP2R1IMGtaBdDTPSzUBKEoAfANULUoBArn0eLaS/B
	Gq8ahd8U4pWEOTYBlboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1m7-0000000BI0Q-3lr4;
	Mon, 04 Aug 2025 20:27:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1m6-0000000BHzJ-0MEC
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64AF441AFD;
	Mon,  4 Aug 2025 20:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C7FC4CEE7;
	Mon,  4 Aug 2025 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339232;
	bh=k5iYYySHG/5Vfd/EFSgIWIBri0jYjQoozxrWTGCJIc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jz81xEhXHgQTDGtffbAFiQrMddlJq+HKTHTbuSwG+khg7OC80YrMcEzbbz4n6c8C0
	 IMKUlfyKUrSQvKI9jvSTbtp42M+M6mtFuAUIcJeEbOXJm+M14gOO3TemuKsyPVbqxx
	 k2IUQ3UfFH1YdxGsAfWddxjG63QNRM6dyM45isTWFFIPN5fS+O+kk+foEa0cPuV7p0
	 giqfltC+FXZ8NPLGAfJxP3J1J/SdNi35u+XA28PDROuGRZiucs6llc5zrnhxl7H24m
	 k4rdTYhoTvrFmWqVopmLYM2HhKNHWzbedFx0Z+KTzvogyrEWgWMbXIgPbWMRrVwdVV
	 WlWleDHgw59hQ==
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
Subject: Re: [PATCH bpf-next 03/10] riscv, bpf: Extract emit_ldx() helper
In-Reply-To: <20250719091730.2660197-4-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-4-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:27:09 +0200
Message-ID: <87v7n23k9u.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_132714_140910_FE3516B3 
X-CRM114-Status: UNSURE (   4.38  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBUaGVyZSdzIGEgbG90IG9mIHJlZHVuZGFudCBj
b2RlIHJlbGF0ZWQgdG8gbG9hZCBpbnRvIHJlZ2lzdGVyCj4gb3BlcmF0aW9ucywgbGV0J3MgZXh0
cmFjdCBlbWl0X2xkeCgpIHRvIG1ha2UgY29kZSBtb3JlIGNvbXBhY3QuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK

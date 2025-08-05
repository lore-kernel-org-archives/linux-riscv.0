Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D3C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIRB4/SnETE0C1RLQh2cahLomUJRP5V4AhYIL85DqgI=; b=4c/3NvggyZlefT
	qWsvzafnggaxEWbmrnf6eizO8D1mizHRItsSLcAFA5JuiGaKEBcU5HZWo1xb5u/BXspj5cj7yIYjp
	Q7uIgaKXeGjurTcVygck6oPZsD0vXu4ib+CUltsaEESDIzrln7n/NYmF+oNh698NDJZ+S21FJSoZ7
	jwsBVpYod8iFmMc1BXfrSG6eydWZswjqY0xkuv2NpC1lJQoYFOhRB17LGE/fM/Qqs8crVc/wspZLH
	vh5NFM1TYBZD0pfCc63eC4OrnocnAdWI+Q3w9rRsZmhbg+rTA/ACIAEU4oQ+COcv/t7Ip62zNTnJx
	bEvNaoxbxruvKs03+K8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBPP-0000000BvIl-1sNn;
	Tue, 05 Aug 2025 06:44:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBGL-0000000BuSO-2dV8
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 06:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D9961A55B61;
	Tue,  5 Aug 2025 06:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF97C4CEF4;
	Tue,  5 Aug 2025 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754375704;
	bh=9mChLtQ6RkKxgwEml2njrUb50R/l++pJ6t2PvzlxK3g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=budyNfZXX1lQB0TGDcAYS3o2sdL3imRucp9UOlpAh0usbpU34FwQlpdd5EK3ZxM5Y
	 GSu99OxSh5gTNoPBUi11dEauH8kDw7MMtOCAoimrWFCT9VH3XeMkUaPlEQdmCfCp0A
	 /sxu9YZFAA+6GETSFPh1CW0jgIMSZYLjqjo71wZHIk6/k2bif+DyKa+3shoYNq7hY6
	 A3Pwqs8uUSHTcIwFuLH1ImIpTMIz3HiXO5zpjCKwffs/jIImC/3EGmWeHHAyWf19ol
	 U22sP4i1L11+Wj0LBWBHvkpvJL8Qz9amaDMqCBZVx6WF/IVD0y+3qH2cqYasJIIkpG
	 4dMtN7+rZYm1w==
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
Subject: Re: [PATCH bpf-next 09/10] riscv, bpf: Add support arena atomics
 for RV64
In-Reply-To: <20250719091730.2660197-10-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-10-pulehui@huaweicloud.com>
Date: Tue, 05 Aug 2025 08:35:01 +0200
Message-ID: <87zfce1dka.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_233505_826480_A8C6B79A 
X-CRM114-Status: UNSURE (   5.78  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgYXJlbmEgYXRvbWljcyBzdXBwb3J0IGZv
ciBSTVcgYXRvbWljcyBhbmQgbG9hZC1hY3F1aXJlIGFuZAo+IHN0b3JlLXJlbGVhc2UgaW5zdHJ1
Y3Rpb25zLiBOb24tWmFjYXMgY21weGNoZyBpcyBpbXBsZW1lbnRlZCB2aWEgbG9vcCwKPiB3aGlj
aCBpcyBub3QgY3VycmVudGx5IHN1cHBvcnRlZCBiZWNhdXNlIGl0IHJlcXVpcmVzIG1vcmUgY29t
cGxleAo+IGV4dGFibGUgYW5kIGxvb3AgbG9naWMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1
aSA8cHVsZWh1aUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK

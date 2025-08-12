Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF10CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRcFiT9NX6hDFClLMUFM5QT2FktMFUS1yE1P92Z+R9w=; b=U/ausV5+rSlAjM
	ZNsL9NiqffBPfXtn2z6qNFETj7Xs3ZQT8wtQ6nBuRYFelP1hOERg3H0Nm9fU8kavWLkYzhHA3nt1Z
	cxeZ1jU0ivpuoRQb5C6hHx4kJrc0TDDS2rszAUivxH5BsgReo+0SptTennwYNU++e5vwJO7HfJytI
	idzqk6G0xiTC3/iYJvMXHJIvOF65RzIajVy4AjWknP3qOV0dcf04nZ3+MimEyPFi8iJJSOsNqbGcu
	bVkLK3mBELxbsph0Z1E2Dxp59ZNMIh2FAM2EaA/aIBrUlIqT17y3UPgFVxK8ZVhh2JG0jCgRzXQKM
	7EzhAqUKMy/XnCsfMIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHw-0000000Am2y-30xv;
	Tue, 12 Aug 2025 12:39:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkvS-0000000AKDj-0Vs4
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:04:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b78f33204eso653586f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754989448; x=1755594248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtp0f/XAF/TX0R94lrjgjIgA7neAmWsQ9XVPNzUOsGo=;
        b=RHj7eSsi/cwZWBCL3XPF4YzS2iFx+TYwZepyUMcoda+Kd7S4NKkXNteF7R/dMbCl7z
         YpOWsTKmJI7sdN2q72H28I3jFgteNYwweYN1l8VJ9SVLWwiiS3YVq4aj6dh2pesgS47A
         h9H0jphHSejvzJu+t83WH8UsfmBW7k/SPXZDB12dE1f8GuV+UKhxmjkdVuenMyBfNi+W
         aa6g+Z+MK3DZrHHKcsy9nLqgkWVuHUlVukHezU3QWHfOV0K8ybLn9KSyCT4jgKcL5ecz
         sSFqDef+yEQVQvlWdXfLduzGAgFZze9LyzYHxpGs2JFd+qw6WkHqk4dXomZ5wmMa9kct
         88dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989448; x=1755594248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtp0f/XAF/TX0R94lrjgjIgA7neAmWsQ9XVPNzUOsGo=;
        b=EPo+j4Th/c7Z+tKpEh82FxlVioQyv3Guw16QHLHtAVSULrWrYCR8spIGLqcUlJwWw7
         vGg3LKWUFHVThVf6um+7z1uft9Lq4ZCFUkmGOqrs11GwfoNdv+xxlFgjDT0xk7bh++wV
         uAXkibnFcfP19ZmGgt3yGXOcG742eVsoqYkF3DQUvpklus+RuhyANUeOT9wqvTHHxRVP
         tXdTe7cNqDDMxmVkAIGmqgz5dSvgxaPNTcEOuCILwGdTFlItYykKvTpuyEK8ebL3y573
         5TSh1QNwqpaYipevRvBRZkWQ6UC/zjYAkfzjSMdggVh/5vx3OAy6n7HBvTntqOkv+8iA
         T2vg==
X-Forwarded-Encrypted: i=1; AJvYcCVrvVaFqOMuYr2/ZnJsgX7iOvmpF7InkVp+O8cV4NMn2x/HzKKKxzVli9GwbDYuJ8QLBGfQ+LfXX/pL6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoEODPtKXgxb54kNj7B+1DQtIK22KXNpQPq1s+4zrluIO81PO6
	Zq73EDIID6pUcjUQ2x6qjA4qFtnFyq+606LxUBNyHmdbpK3z+dz9p/iIhcwjZVPhBbs=
X-Gm-Gg: ASbGnctXF283z5uW0i9z+BPcuII89lf/w9C09CpKb6rVJfNNpNwS2qWkHImQPx8N738
	fRA0ICFvQIJhe0xc+WIJC/H+ldqVwef6LYscexiBsquvg/+/Tk9lanM/LsY9TTm9eD4DK5xQDLg
	JS2ufeI5boCIqOcPdDPFfMMe9nlKKsyefOvt5TJCeWQSDGdScSoB+ncEUzzafRzfc15OG/dEkum
	/vM7JuMrcPygsOs1jJmB8tKb573Jhe/8pab8x7Ou+g8MWE3KLPH3ymBd0OYHdjxI3zTvBl4pvnX
	hyJLCZr4Josh3JJMAleOzNBSJNUmLV7VCA3/7ruhQPRQzm23Fh3yMYfNjECQ4A7g+HEztbn69WL
	E0+I4fvQ6eEhFhJiDf6RyeYH1sn5Ptw==
X-Google-Smtp-Source: AGHT+IH6MhMdd/azBMg6FFj7maPvuhuBI0aLHfN/OOEfRoWpInAXZIecXHTDdNehcRNL9lr4GrhaQA==
X-Received: by 2002:a05:6000:230a:b0:3b7:889c:69d5 with SMTP id ffacd0b85a97d-3b91538ea0emr120027f8f.12.1754989447868;
        Tue, 12 Aug 2025 02:04:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8113:2b11:8f42:672f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3ac574sm43479697f8f.5.2025.08.12.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:04:07 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv, bpf: fix reads of thread_info.cpu
Date: Tue, 12 Aug 2025 11:02:54 +0200
Message-ID: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_020410_163115_5267A291 
X-CRM114-Status: GOOD (  11.16  )
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

SGVsbG8sCgpUaGVzZSBwYXRjaGVzIGFyZSByZWxhdGVkIHRvIGEgcmVjZW50bHkgcXVldWVkIHNl
cmllcyBbMV0gdGhhdCBmaXhlcyB0aGUKc2FtZSBidWdzIGluIG5vcm1hbCBjb2RlLiAgVGhhdCBz
ZXJpZXMgZmluaXNoZXMgd2l0aCBhIHBhdGNoIHRoYXQgd291bGQKaGF2ZSBleHBvc2VkIHRoZSBC
UEYgYnVncywgYnV0IGx1Y2tpbHkgaXQgd29uJ3QgZ2V0IG1lcmdlZCB1bnRpbCB2Ni4xOC4KCkkg
ZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgQlBGIHRvIHZlcmlmeSB0aGF0IGl0IGVtaXRzIHRoZSBj
b3JyZWN0IGNvZGUKbm93LCBzbyBhbnkgcG9pbnRlcnMgYXJlIHdlbGNvbWUuCgoxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDcyNTE2NTQxMC4yODk2NjQxLTMtcmty
Y21hckB2ZW50YW5hbWljcm8uY29tLwoKUmFkaW0gS3LEjW3DocWZICgyKToKICByaXNjdiwgYnBm
OiB1c2UgbHcgd2hlbiByZWFkaW5nIGludCBjcHUgaW4gQlBGX01PVjY0X1BFUkNQVV9SRUcKICBy
aXNjdiwgYnBmOiB1c2UgbHcgd2hlbiByZWFkaW5nIGludCBjcHUgaW4gYnBmX2dldF9zbXBfcHJv
Y2Vzc29yX2lkCgogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjUwLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

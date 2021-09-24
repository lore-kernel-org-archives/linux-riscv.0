Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAEDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 15:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDA6610FD
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEDA6610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dA7B/i1u1qs5e88kZGDF+r5lX7KkdII/+6n5KfOVGCQ=; b=Srcv7sDpGAIeKJ
	4BAeOHPJ3xpiTSlgP3LORPs0XrBIRYXxbGwx32j9Y49WKYAS9INe/WJ9AMNkuyPGTLVEP9JCymLr0
	Y+AoXUFoUgcCsC0s9AAL/87M0yEauomp2gzYBXVpLO3WX2GWSckchjWicOJsf9h6IHjklKECLSu6z
	OrGhI+VHv9EtEheYTS8+LrYA4OqDMhu14IZHWQfiQ91KG7qEedREiRV2LJ+xSOq7x75noXSUUkMXw
	Mp/L6r7KNw1OduqsdQpwBkzgqMdtyd+gq9cjTw4PVpEBGQ5k2qn5hU+LRFmTnDKBJTxZujomXrZY8
	e4ffDHZebZfebgXkUQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTn8S-00ExJp-FV; Fri, 24 Sep 2021 15:29:12 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTn8Q-00ExHI-Ih
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 15:29:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id dj4so37607035edb.5
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQ4WoixwfLVdKjcnesh6NOhR1rMTQv8BrkQ4NsoRsXs=;
 b=OXc/hyI9GTCK+r2jZvfkIM60vIrZpMtC9u++J3SvEMaAQRrQ5m7fIAlo1oqy7psWdO
 u6TWGc77Nr3VHocHKcnAevVn2p2Ub19oWQrRpnih7yfCyR8YsyBjXveqsyaW9btPh3qw
 0MeaQCqw1xFoZFMDAVMBFsEZqCH3XeJEXszzNBGLcbHVHgxaZtS9t97BwchXzjh87+pn
 2MpRjZntoZxlgwVhYUebJ+CoQS+E5fv7kZSqrX1AIV/GUKXcO7Qnr/FZevJAubjUj0oK
 bL/CYLX0y/VadO6EydhFGm/K8vc3FNw7CUjgzzH38+JvEJNSheR1d3ecPpSID0rfoASS
 Y+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQ4WoixwfLVdKjcnesh6NOhR1rMTQv8BrkQ4NsoRsXs=;
 b=18GhhR7BLCInKeCOnTRsRG4Evwa9GoDnNVNhpIahZaTW13jzFxqsxgq/9QvkSxVZzl
 lnGNAk0vgCxrzobV8MLacWJ9kLQhpwIqHk5m3hZuiByquvtx9bB0S6tHlyxbQokaBdDI
 POL39wiwTk53KR9QDDFpEQeNbIn0+WUhnrSCx6UKNG36e4j4B8iKt5+v6pdKorOksRu1
 SZt/CcJ+NHYKchpvqxiczs4YrwWSZcmHrCa+0JA4lmAx3b9hXYQiX7DBVkIezWN5/RMv
 Zbf+5DeC0/RFuCCBtZnYU3dwN2Lm0oIN1dPaijEZZNWqW3Nxj3tMWh/CyaIYlTGoCEMj
 sxMg==
X-Gm-Message-State: AOAM533+q1gBUK13ggWWMRyt61Y7ij4SHR7z9Vj9M2ssWntaizzZ10l9
 ZlEPCnsglUgf4DhJzQsMXiAy4Mr/80xAS8WlJbA=
X-Google-Smtp-Source: ABdhPJx9Y0/DcbZ4SRmB6bUv2OExliUvt7b048hk331CiDBjNZuDrACJzzX6fRthwZYVv1rbZUpHKUdHO7EpdHOvxOM=
X-Received: by 2002:a05:6402:21d0:: with SMTP id
 bi16mr1975909edb.124.1632497344106; 
 Fri, 24 Sep 2021 08:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210924095542.33697-1-lmb@cloudflare.com>
 <20210924095542.33697-2-lmb@cloudflare.com>
In-Reply-To: <20210924095542.33697-2-lmb@cloudflare.com>
From: Luke Nelson <luke.r.nels@gmail.com>
Date: Fri, 24 Sep 2021 08:28:53 -0700
Message-ID: <CAB-e3NQNkzcv6hNW1ga0Zhi_DcUVr2Q88WaE1m+CCXtKhHQcmw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/4] bpf: define bpf_jit_alloc_exec_limit for
 riscv JIT
To: Lorenz Bauer <lmb@cloudflare.com>
Cc: Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 kernel-team@cloudflare.com, 
 Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_082910_639451_5FE0DECB 
X-CRM114-Status: UNSURE (   4.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> Expose the maximum amount of useable memory from the sparcv JIT.

sparcv -> riscv?

Otherwise lgtm!

Acked-by: Luke Nelson <luke.r.nels@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

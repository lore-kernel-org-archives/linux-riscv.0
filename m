Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD298C9EC66
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsBjvtCSZwBz1JbRI2C6LTahfK27hdtYV4XL/rwU/jM=; b=jTAhZl1GCGISK6
	6tpAVjkC6eA2h7eWyZ75kTrMx0sx5IVikRRXEZO34ckG7EZQa2IbZQqdy7COnZGwv2jmL6Nrnte+R
	T2b1ZroGbsSsMAmqcV+cfSWTv6h/vwfYDQSGlALyozXlcw46awwA59iobV79VGE4O4kp9P0SOSsEH
	SpGuourUiLs0DSTzwO1N9F/41bJSvOqEWfvPfin5DROnRlbjQY5l2iEjS64f9kSCNtxFri9LWDye/
	MKXn0UHaFIF7iB+SI/Y0rOI7PQjdK86zqhAPTiAx3zt3aKBnuSqxQL0kZQCv4KO10Jg2o94zPZa1k
	HcFZaxrheip2OjpwIakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFSs-00000005CM6-2T3M;
	Mon, 12 Jan 2026 10:48:02 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFSp-00000005CKy-1DgL
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 10:48:01 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dqTc73xfXz1sG8X;
	Mon, 12 Jan 2026 11:47:51 +0100 (CET)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dqTc50Kz7z1sG8K;
	Mon, 12 Jan 2026 11:47:49 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dqTc450Rtz1qqlW;
	Mon, 12 Jan 2026 11:47:48 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 5xyWnyBHaP_3; Mon, 12 Jan 2026 11:47:47 +0100 (CET)
X-Auth-Info: SSvjvNtRh5vfqOJuaTWqGcpcynIQ3r1wcZPSLPTfB+jtBxxbGYpGhF5kFG0qbYIO
Received: from igel.home (aftr-82-135-83-110.dynamic.mnet-online.de [82.135.83.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 12 Jan 2026 11:47:47 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 588F32C21A6; Mon, 12 Jan 2026 11:47:47 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org,  daniel@iogearbox.net,  andrii@kernel.org,
  martin.lau@linux.dev,  eddyz87@gmail.com,  song@kernel.org,
  yonghong.song@linux.dev,  john.fastabend@gmail.com,  kpsingh@kernel.org,
  sdf@fomichev.me,  haoluo@google.com,  jolsa@kernel.org,
  bjorn@kernel.org,  pulehui@huawei.com,  puranjay@kernel.org,
  pjw@kernel.org,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  alex@ghiti.fr,  bpf@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v2] riscv, bpf: fix incorrect usage of
 BPF_TRAMP_F_ORIG_STACK
In-Reply-To: <20251219142948.204312-1-dongml2@chinatelecom.cn> (Menglong
	Dong's message of "Fri, 19 Dec 2025 22:29:48 +0800")
References: <20251219142948.204312-1-dongml2@chinatelecom.cn>
Date: Mon, 12 Jan 2026 11:47:47 +0100
Message-ID: <87zf6jayzw.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024759_498071_DDAC09F2 
X-CRM114-Status: UNSURE (   6.27  )
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

It's rc5 and this is still not merged.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

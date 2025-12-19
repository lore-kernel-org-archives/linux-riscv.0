Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4240D767E5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubsofz1XfGkOk0f/JSv05dJsCA40gh68N+DVOGxJQm4=; b=1wpI03c4hJh+sH
	MICOf2d06BhlGuM2zHCj47+WLVwh13tQpuTPylIaa0lKkUbypD1/rd9/N7W8PTnSGx7kpcRJj52KE
	cg5oTKw+0HZ9zakyHHo+U+PWYItRYopTqs08pKKxdRsQlqwzqNJa0RGQ7YFODAJhwsQsIvlol2VSY
	A1nL3kt9vskZyvWXLwkInJNWKa9RgPnhwUkXeghHqe1fwzT+sqU25LkeGmukVvVS9jYLPiw/i2VKO
	aj/BekIFYgWzqfvipqbD8oHINXIE2zWV2oBoOQnWy59xXfnA8w0x13Mub0iQJvPYKZSAFa+Ypf4fX
	t/uImW/j2yg91OaR4BOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYrm-0000000ACkb-3oyx;
	Fri, 19 Dec 2025 11:41:50 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYrh-0000000ACk9-3Ptg
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:41:49 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dXlxL19g8z1sFNW;
	Fri, 19 Dec 2025 12:41:42 +0100 (CET)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dXlxH1dJCz1sFNH;
	Fri, 19 Dec 2025 12:41:39 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dXlxG5Zj7z1qqlS;
	Fri, 19 Dec 2025 12:41:38 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id yUPy3BUYOinu; Fri, 19 Dec 2025 12:41:28 +0100 (CET)
X-Auth-Info: NdOAqSKqpUa2L5w9K1GQfsmLFAunuGbI2egYxigMFH/QHOan6ylJbRSfO4blGbe+
Received: from igel.home (aftr-82-135-83-185.dynamic.mnet-online.de [82.135.83.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Dec 2025 12:41:27 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id AA7802C199C; Fri, 19 Dec 2025 12:41:27 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Menglong Dong <menglong.dong@linux.dev>
Cc: Menglong Dong <menglong8.dong@gmail.com>,  ast@kernel.org,
  rostedt@goodmis.org,  daniel@iogearbox.net,  john.fastabend@gmail.com,
  andrii@kernel.org,  martin.lau@linux.dev,  eddyz87@gmail.com,
  song@kernel.org,  yonghong.song@linux.dev,  kpsingh@kernel.org,
  sdf@fomichev.me,  haoluo@google.com,  jolsa@kernel.org,
  mhiramat@kernel.org,  mark.rutland@arm.com,
  mathieu.desnoyers@efficios.com,  jiang.biao@linux.dev,
  bpf@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-trace-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of
 BPF_TRAMP_F_SKIP_FRAME
In-Reply-To: <3730454.R56niFO833@7940hx> (Menglong Dong's message of "Fri, 19
	Dec 2025 10:22:01 +0800")
References: <20251118123639.688444-1-dongml2@chinatelecom.cn>
	<20251118123639.688444-4-dongml2@chinatelecom.cn>
	<874ipnkfvt.fsf@igel.home> <3730454.R56niFO833@7940hx>
Date: Fri, 19 Dec 2025 12:41:27 +0100
Message-ID: <875xa2g0m0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034146_018603_997F9946 
X-CRM114-Status: UNSURE (   6.15  )
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

On Dez 19 2025, Menglong Dong wrote:

> BPF_TRAMP_F_ORIG_STACK

How can that ever be set?

	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
		return -ENOTSUPP;

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=uwsC=6H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DDEC2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2020 05:29:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D13E206B9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2020 05:29:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="few8zysI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GApN3mpn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D13E206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OvwANZ50BYHbdM53cjg6Ie9KQxCh8TcIYuZW9bMZWgo=; b=few8zysIL1S9NNMsEvmiod7Gv
	baj1LoIJmAZn8ODQDkwkIbUKStoBnkF9O7LTsNuLTYVFCnCwrhBkd2iJPmrirRAxC0r4TiYE1X92N
	ZsuFDf7+srabyt/mtrIVT5N8Zkm/yRGfT4r8rFUGpuQA7xpHeedwDNPYIppZ3lTZy05uXO0OL4Eyt
	agXv/lMUCRsz3oa1HFZ+g8XKGYskAl+NMrtrAfXeXEzlkuSua1jM907OXoT87uTv3x9bAay6N8UFi
	iEjRdyouSZvUK94jhQGoegDjcohZTfqjv+GGgXppUwrKXwfbH0SwTH50aRz9r0VhK+jc6U2TMm2hG
	Jp2nKWg8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRUQJ-0007lF-Vw; Thu, 23 Apr 2020 05:29:19 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRUQH-0007kA-VX
 for linux-riscv@lists.infradead.org; Thu, 23 Apr 2020 05:29:19 +0000
Received: by mail-lf1-x142.google.com with SMTP id j14so3690979lfg.9
 for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2020 22:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OvwANZ50BYHbdM53cjg6Ie9KQxCh8TcIYuZW9bMZWgo=;
 b=GApN3mpnXSsQdVgpO16HhRHm9D1UrgLe4GItyxL85AvES2eFwsurcz7JqpuGO/QpE6
 vwo0YNln1qG9Rb1IROFKqgw61A9NT2O6ewlrXGb1fVRAlPK0oMBzdLgRdIrK2206nwiX
 KuWFclv+4jA8Qf8wf1ZmvRYjcnq9L/gjn5POj884T7Fm7B4TKyBNjd88fpoe+FguYTW3
 oQRbRtKdSCB7eaq+X8QwHHOgltPd5VIMjTVBr1HAE7czIyi3YSxYwH7nCKoqJsWccHMW
 LzdaUYmlTijiYs7vIxTPGms8+t7V2bLK6MRZCDccD+lKuIA6iFg2pZrehKsdAmxoFHwF
 8/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvwANZ50BYHbdM53cjg6Ie9KQxCh8TcIYuZW9bMZWgo=;
 b=pHHD+pJTdXNBTQ0CUyL6G4BksQF/cckWB6oYId/RpZdVPSjqgUzgrI6skKxfV1ZM5q
 9m1my/SnlqvxjgszjBrSdg1ld7p0TMhzTuxd488UPSkt2/nV/STjK509KcyTpiTphSrX
 s7tc2mW2GDqMgFp3tJ3CNXKqZ4MYO//E9y2RCCe3CdgwVU3le179EubnL2objufEoGmf
 7AElxirsRXWgjLrFOwNZoA49qROgQKVfFyJNukYSF/GmWwb3KGn7p7OOq1m21OR7KxzK
 X1xQKfle9j2IT+PXE5P+Fyfuh9dBIJWKZDACX48X8EcVhYB3I26NPy39YSXU33IXctIp
 i4uQ==
X-Gm-Message-State: AGi0PuZu8kiC/0KlDQRuP1OW4Be3P0c+JCLbKVyp+BClqL0X/sy2ct4j
 y7ZDn2AUkYACh+suQr79dxVyUq9EqpxPQWUTzw0=
X-Google-Smtp-Source: APiQypIBAfdsfyIcYH5jTMKcB5AikSQ0/9NuwH9FYspTBf/i9YuCKHSBz8UMRJTv1vpiZ1TqZIdKEthn4AXRo5ktzXc=
X-Received: by 2002:ac2:569b:: with SMTP id 27mr1280515lfr.134.1587619755739; 
 Wed, 22 Apr 2020 22:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200421002804.5118-1-luke.r.nels@gmail.com>
In-Reply-To: <20200421002804.5118-1-luke.r.nels@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Apr 2020 22:29:04 -0700
Message-ID: <CAADnVQ+taVOr+Zr44eGgOoHXD6y-T-KBKco4KbFZ26jAOsa90A@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf, riscv: Fix tail call count off by one in RV32
 BPF JIT
To: Luke Nelson <lukenels@cs.washington.edu>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_222918_036151_84EAD7F8 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Luke Nelson <luke.r.nels@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 20, 2020 at 5:28 PM Luke Nelson <lukenels@cs.washington.edu> wrote:
>
> This patch fixes an off by one error in the RV32 JIT handling for BPF
> tail call. Currently, the code decrements TCC before checking if it
> is less than zero. This limits the maximum number of tail calls to 32
> instead of 33 as in other JITs. The fix is to instead check the old
> value of TCC before decrementing.
>
> Fixes: 5f316b65e99f ("riscv, bpf: Add RV32G eBPF JIT")
> Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>

Applied. Thanks


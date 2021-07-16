Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD68C12002
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 20:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0838761006
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 20:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0838761006
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOqld9Fh85FMhyyVZk23FoZmv07cllhD2FdQXSeVbOM=; b=JOPD4DYr3mGZCYflGxNj/x5VAE
	FKdRQP38DG98aW9ySlOW56Bko/BAjIFX9AZ8wnrdh04QRDpNGR/wDvPJHZZk4baLbUT7jyBFKDdP6
	S283MkkCinD3isLp5YjcLFZtTswtI2j7KnCiwQEGhYp7b9b7lnF5DCX1OSY1U0lCluQp83vTHURzq
	A1nN0uiu7oCmSom3vyn4Faha0C6cDRqklz3KLIQXgyXHNpq6R93vgxDCqRhhGU3Z8Do+3zBcAg9f2
	2S0vx6vHnWPnBnpj8ey55SmXgZfxtOxjyOt8EpKHc3AZc+Obq4pzzp7ztocZzYb5VCxWhEpsw47kc
	hdPtOFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4UD1-005CP4-Ly; Fri, 16 Jul 2021 20:13:19 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4UCy-005CNe-IF
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 20:13:18 +0000
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1m4UCf-0006dK-96; Fri, 16 Jul 2021 22:12:57 +0200
Received: from [85.5.47.65] (helo=linux.home)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1m4UCe-000QgN-RO; Fri, 16 Jul 2021 22:12:56 +0200
Subject: Re: [PATCH v2 bpf-nxt] Documentation/bpf: Add heading and example for
 extensions in filter.rst
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>
Cc: "Roy, UjjaL" <royujjal@gmail.com>, Song Liu <song@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Networking <netdev@vger.kernel.org>, BPF <bpf@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
References: <royujjal@gmail.com> <20210712173723.1597-1-royujjal@gmail.com>
 <60ee2dc76ac1c_196e22088d@john-XPS-13-9370.notmuch>
 <CAADnVQJ=DoRDcVkaXmY3EmNdLoO7gq1mkJOn5G=00wKH8qUtZQ@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <80579c8d-ecdb-4334-9912-c04f75f7a6d3@iogearbox.net>
Date: Fri, 16 Jul 2021 22:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAADnVQJ=DoRDcVkaXmY3EmNdLoO7gq1mkJOn5G=00wKH8qUtZQ@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.2/26234/Fri Jul 16 10:18:39 2021)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_131316_657880_0EFEA90E 
X-CRM114-Status: GOOD (  12.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/16/21 3:48 AM, Alexei Starovoitov wrote:
> On Tue, Jul 13, 2021 at 5:20 PM John Fastabend <john.fastabend@gmail.com> wrote:
>>
>> Roy, UjjaL wrote:
>>> [1] https://www.kernel.org/doc/html/latest/bpf/
>>>
>>> Add new heading for extensions to make it more readable. Also, add one
>>> more example of filtering interface index for better understanding.
>>>
>>> Signed-off-by: Roy, UjjaL <royujjal@gmail.com>
>>> Acked-by: Song Liu <songliubraving@fb.com>
>>
>> Looks OK to me. I thought the original was readable without the header, but
>> if it helps someone seems easy enough to do.
>>
>> Acked-by: John Fastabend <john.fastabend@gmail.com>
> 
> I cannot figure out how to apply this patch, because I see:
> Applying: Documentation/bpf: Add heading and example for extensions in
> filter.rst
> fatal: empty ident name (for <>) not allowed
> 
> Any idea?

Same happened on my side. Maybe not sent via git-send-email(1)? Anyway, I've
applied manually meanwhile.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

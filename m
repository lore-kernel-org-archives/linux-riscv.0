Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D490606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uQQGgnEZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=ciedm+7r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cSQrLn3PZoD/NJlet5/pXOlTFzzzWVVEZsw8uYFi1IA=; b=uQQGgnEZycG7ll/gTey0CaILSi
	iumrhitvtCrN4rHM71DdFtAjaa92y09LOA0lVSnbD7jHBH3mkVHX3h/+OSsyvgKni6sdhyzBNR9cx
	qt99z98Bb54uvbs9CIrCPORUzjNfzwn4AsSX8mMiHlFQX00+SZUoRpR7FNUdqmxMTT/eBCpfsjcvR
	eatiR4KwdxXZZf7YAQ+ip5BV/xX8kTMzm+pudGuAZB/3Hd2QHXX1bc3TXz0WsVd7BoXHfG+ph8vcP
	jojEz4GfhYXHx9e6iIWm3nOo7j+m6n22HMyjQay3ZZNERqjURcZBnqJRE9HUvIRPIXd3HVIP9DC11
	oFpLIh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsnQ-00000006xsG-0p6z;
	Tue, 24 Nov 2026 15:51:04 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsnL-00000006xqd-3Z1g
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 15:51:02 +0000
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 8A3DB120A81;
	Tue, 24 Nov 2026 15:50:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 0DECA20029;
	Tue, 24 Nov 2026 15:50:52 +0000 (UTC)
Date: Tue, 24 Nov 2026 10:50:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sarah Emery <sarah.emery@canonical.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Shuah Khan <shuah@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, Hui Wang
 <hui.wang@canonical.com>
Subject: Re: [PATCH v2] selftests/ftrace: Account for 8-byte aligned
 trace_marker_raw events
Message-ID: <20261124105047.23c39b69@gandalf.local.home>
In-Reply-To: <20261010234645.173550-1-sarah.emery@canonical.com>
References: <20261010234645.173550-1-sarah.emery@canonical.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 0DECA20029
X-Stat-Signature: 6pjgmfyk6na7sr1sycakuaamwqz1gft4
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+5ChBTssD8JBhJ43i6DVvb8POD/Y8N1Yg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=8CqJm7M0yv4/2wYmOKC/zfDe65AOuxRbGrFH0p4VsnE=; b=ciedm+7rPzFY39V1r/cvvdx6q6owk4Jag/6O4PoItZZzFzqanHP688mg9Gb5Oh8DAIl5ElX9hAGtd4xvwVtuDV9KZjYwhlR7kx27PvdvmP+Hn1s0UF0bD6uKGSJDi7KdS/Byl5VkKUQjCCaIb7h9lirr4Xi7kjsIDto1Dd0T7k8=
X-HE-Tag: 1795535452-708807
X-HE-Meta: U2FsdGVkX18/ONp8OX8bgHDSKuPF05HxfDxMiVtEkw4nm9gPOmmhU+1iKHvaS7MctvvnPU3uz/UK5nWJqwcJ3J9XTxe4VJFueYHSl+dGf6OYjM0uGJcHMzMXz2fLevfyVLDzY3eUWc/c+tkBDKP7vbOCuuXDk2mPXb+UxfTUtFczlcipjLDwDyGWBDrv24U7KBE1+8VP7N9QqokLOns0rBqh01jYqa4AGlTX94+pdZA1S8G99unk9MdLJ2VNBeCs4CvZ7Jkf4E82ucy/WsGULzSJSVvrhoGycWVMWVOIa1xzklSxdH8U3SUz2pseyNEqiP4FborzvJO0mgIkcbU2kxPZwVTqgGHAXFDTaam9QYsZoEBiBFj96GhscrO30peOKpq/guBOaGT4XFlSjfn4Zg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075100_090888_E939C734 
X-CRM114-Status: GOOD (  27.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 11 Oct 2026 01:46:45 +0200
Sarah Emery <sarah.emery@canonical.com> wrote:

> trace_marker_raw.tc expects the length of each raw event to be rounded
> up to a multiple of 4 bytes. That is not the case when the ring buffer
> forces 8-byte alignment of events (CONFIG_HAVE_64BIT_ALIGNED_ACCESS):
> the id plus the data is rounded up to a multiple of 8 bytes instead, so
> trace_pipe shows 8 * N + 4 items. This was seen on riscv64.
> 
> Make the test accept either rounding.
> 
> Fixes: 37f46601383a ("selftests/tracing: Add basic test for trace_marker_raw file")
> Reported-by: Hui Wang <hui.wang@canonical.com>
> Closes: https://lore.kernel.org/all/20260607072431.125633-3-hui.wang@canonical.com/

The Closes tag is for bug reports not previous version of patches.

Do you have the link to the email that shows riscv64 fails? That would be
what you would add to the closes line.

> Signed-off-by: Sarah Emery <sarah.emery@canonical.com>
> ---
> Original v1 patch from Hui Wang was posted in June and only patch 1/2
> was merged (commit c37e0a4b79a6).
> This is a v2 for commit 2/2, addressing reviews.
> 
> Changes since v1:
>  - Drop kconfig_enabled() and the CONFIG_HAVE_64BIT_ALIGNED_ACCESS
>    lookup. The review of v1 objected that it depends on the kernel config
>    being readable from the test environment. The test now accepts the
>    4 and 8 byte roundings based on what trace_pipe prints.
>  - The expected length for the 8 byte case is unchanged (8 * N + 4).
>  - Rebase on 65f26d15f7db ("selftests/ftrace: Fix trace_marker_raw test
>    on 64K page kernels"), which changed how the test writes its events.
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
> index f985ff391463..dd2b94be0947 100644
> --- a/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
> +++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_marker_raw.tc
> @@ -67,7 +67,8 @@ test_multiple_writes() {
>  	# add a little buffer
>  	echo stop > trace_marker
>  
> -	# Check to make sure the number of entries is the id (rounded up by 4)
> +	# Check to make sure the number of entries is the id (rounded up by 4,
> +	# or by 8 on architectures forcing 8 byte alignment of ring buffer events)
>  	awk '/.*: # [0-9a-f]* / {
>  			print;
>  			cnt = -1;
> @@ -77,9 +78,12 @@ test_multiple_writes() {
>  					i++;
>  					cnt = strtonum("0x" $i);
>  					num = NF - (i + 1);
> -					# The number of items is always rounded up by 4
> +					# The number of items is rounded up by 4
> -					cnt2 = int((cnt + 3) / 4) * 4;
> +					cnt4 = int((cnt + 3) / 4) * 4;
> -					if (cnt2 != num) {
> +					# With forced 8 byte alignment, the id (4 bytes) plus the data
> +					# is rounded up to a multiple of 8, and the id is not counted
> +					cnt8 = int((cnt + 3) / 8) * 8 + 4;

Instead of doing both checks, it should check 4bytes first and then 8 if
that fails. Although, it would be better if it knew it was running on an
architecture that doesn't support 4 byte alignment.

-- Steve


> +					if (num != cnt4 && num != cnt8) {
>  						exit 1;
>  					}
>  					break;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

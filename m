Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D12DC982D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 23:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSKRC+YyadULItoNzmEl+6vhfzW2sbbpKMhOxd2ewFU=; b=4bCKMrWHbh2VTx
	M2Rx2kyuU0sWG5UmkQNzg+b/W66S0U5diSxaU7DuPFT1nCRJZecLiO9qfXxHStoFhBOf/s3LA3/nA
	f87KzHKmVw06h/8mvExplENJrDzJ9kIxqdvLjznBBi5QdurHbNjoEjW6bjZgeyyQqLuvBgSsd0Kzf
	hMDuzN6sx2ntN4HBCFlquTr02vw+i9D7YiIZjKGOVKWT9zzS4O/G0YK99qrr1Je7DpA61Q6vssfs+
	8UfTohEU3pTJXCy7sKolNTRJsLqItV7WrgVkU4hgT28lMxoS4fnVB9zKM5WYrq2aZ5EZcviIGs9vA
	w+RBqZ6VU75UsFJNV6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lfq-0000000Cnzo-0bXL;
	Thu, 17 Sep 2026 23:37:50 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCnG-00000002R7u-0m47
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 12:31:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2a07:de40:b2bf:2b::1244])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3DB3F87356;
	Wed, 26 Aug 2026 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787747502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w60MUEPPZZbvYy8QQ4yVOi1L7uwwFMmDPTTTaGxo5h4=;
	b=JjO/JJpb/8Wfqqzx1cI/6gFvp/xzHc80uqkN+i567O1EAgIE/vCtToER7AF+ibCVPRuMo1
	c/D11PLEAnKdQk+K6dUUmUxIjhDLlLuLE60AxWIXQelP2RaSOUwrCzSgw64BBWTgZ3SV4q
	5BzNofWMjyjRt1Ab0SQwFK9IDzNuEOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787747502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w60MUEPPZZbvYy8QQ4yVOi1L7uwwFMmDPTTTaGxo5h4=;
	b=rtXoyWTPDMbXjHFu72LfrYZfl3rQD0tGHtgtWs9ZNyb2EHMybfJJtBB2DU73UPzFx/cSkG
	4RhNvCY2lDg5EAAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=s6YMpsXp;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=3rRqRllx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787747498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w60MUEPPZZbvYy8QQ4yVOi1L7uwwFMmDPTTTaGxo5h4=;
	b=s6YMpsXpEULDXFWfejACdaOtBcEISjW86Qjl/fsLX0v1jtNQU909v0FRQr7cv7SXMHTJsK
	DoP7FjtGvhh6w/fhDMxYd69bYj4FZBAPAX5+UGz1vfYOk+LVqOQvr8e1vTS9dzj/mv7s1O
	H1fzEdHnk0Nf9e9N38edioAkOQCLRRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787747498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w60MUEPPZZbvYy8QQ4yVOi1L7uwwFMmDPTTTaGxo5h4=;
	b=3rRqRllxzJU+Zcuc3dcoMsc4W3ek9SN9J8rJlIeAFVIFPQdbNuT/Lv1xx5XECDSbMPAkZ7
	yaJNiGm38NjtwFBw==
MIME-Version: 1.0
Subject: Re: [PATCH v5 7/7] selftests/livepatch: Add RISC-V syscall wrapper
 prefix
From: Miroslav Benes <mbenes@suse.cz>
To: Wang Han <wanghan@linux.alibaba.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, Oleg Nesterov <oleg@redhat.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, 
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, oliver.yang@linux.alibaba.com, 
 xueshuai@linux.alibaba.com, zhuo.song@linux.alibaba.com, 
 jkchen@linux.alibaba.com, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20260804103626.2803112-8-wanghan@linux.alibaba.com>
References: <20260804103626.2803112-1-wanghan@linux.alibaba.com>
 <20260804103626.2803112-8-wanghan@linux.alibaba.com>
Date: Wed, 26 Aug 2026 14:31:33 +0200
Message-Id: <178774749311.159175.197938017149793901.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=520; i=mbenes@suse.cz;
 h=from:subject:message-id; bh=3R4U9U3LOQcVPjm8gFeqKN8zymsv4hvRyJVxXwif1qk=;
 b=owGbwMvMwMHYWJt9x2W1tA7jabUkhqy+O8vnqEukLZkoF3nULnnRwzVdzxet08tb2n/u//Pji
 2wC5VqrOhn9WRgYORgsxRRZXu91ljOckmugWf3uLswgViaQKdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BgxcHEKwFQbsLH/09PfUWOQGdS2gvPIl4Rjuw2KWK/fMVqQmM7AP0lpzq8wXs5P6pY7Zz5
 tjtj3I9xqsdgaSUZW+8UM1mptHiXXmJzbJM92B32433rv1/SLy0Md/s5zUyp7trZLJapBcOX65/
 uklsmmr2/br77B3tvv+Ox3aS832wTEMx5OZjI9XKRzxaiENduL/bVNlYxcktR8K3tHq+D69dvKD
 jbtfF11Q367uri1zpzaD1NmVsZr7jwaWWTZfuZ8m+NLkz8sVsdetPNHKH0Q2Nhy5Ijt13eXQ7Im
 tdmdMV52X4Vtqf7itIk1q9UltnzwYbx5/kX933kajNOrrl2cd+aPqIdMdM+/jAP/xJ4ve3Dj4Me
 gkk5JAA==
X-Developer-Key: i=mbenes@suse.cz; a=openpgp;
 fpr=91BB0699882EF39D46654BB3FF98A38DA80834DA
X-Spamd-Result: default: False [17.40 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	HFILTER_HELO_5(3.00)[localhost.localdomain];
	NEURAL_SPAM_SHORT(3.00)[0.999];
	BAYES_HAM(-2.99)[99.96%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	ARC_NA(0.00)[];
	DIRECT_TO_MX(0.00)[b4 0.17-dev];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b2bf:2b::1244:from];
	R_RATELIMIT(0.00)[to_ip_from(RLsioq18c1iinsph8nfbxhofki)];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim]
X-Spamd-Bar: +++++++++++++++++
X-Rspamd-Queue-Id: 3DB3F87356
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053150_531632_76D669C7 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 17 Sep 2026 16:37:31 -0700
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

On Tue, 04 Aug 2026 18:36:26 +0800, Wang Han <wanghan@linux.alibaba.com> wrote:
> The syscall livepatch selftest resolves and patches a syscall wrapper
> symbol. To use that test for RISC-V livepatch validation, add the
> RISC-V FN_PREFIX definition for ARCH_HAS_SYSCALL_WRAPPER.
> 
> Without this macro, the syscall livepatch selftest cannot resolve the
> RISC-V target symbol, and the syscall-related livepatch test fails on
> RISC-V.
> 
> [...]

Acked-by: Miroslav Benes <mbenes@suse.cz>

-- 
Miroslav


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLS5zzfNLMwwNmZXP0zQFdc5E1cHStqCkbZpGIEMaI0=; b=4Ab202PT6UJRhs
	vEUR79mnf4Em30c20bRZ2f5fAVSFt8WIo7s837DHjGx0fOzCGJbfgHbwd10oFMLCgKps8xQumRpYo
	oBmDWGrDv84DBvm/mX9Rw9tq42dxaQjDU/1GBaMFo9uItLpMa+HizD4b0jGaBzrrbqrA4VlHGnDr5
	bu5kQYEfEPIcDx8Rp+FfcIoyllmedBpoW6DaqLktrVfUskukZm3zCX0RBSyYcks0rwP/w70QNe53e
	KzKPKDTzHlEvupDa8S/NTAhwL9l73cdSI0bVMlXuELAphaih0yK4M+gJnYH39fybAU6W2SuyduVFz
	JeswTKEnrxLO75xZdkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYMA-00000003dBs-0MXM;
	Thu, 18 Apr 2024 20:27:42 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYM6-00000003dBA-3jKQ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 20:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713472059; x=1745008059;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=56WvnS3f709B7K9RPGkczORnhOF3uY6m2yAEXZgpwNA=;
  b=DB0POWWLlRm3NDxtx3xHinYLcGsgYEu5dEoLYqq4BSoXhVcbxhQkJK0S
   jbA5jE7liNv26egRDNbeI7ncJ6HJHMxkW13fzy2wCkk2WmCXIs9nBNgnc
   ttfIYLTS76GWusMUnqEDtajU+fS125iEP+zm9E3dqcAdV6OpdOKSfJEpD
   5MA6T2iJUEwu4PRdLaDbnKbiAXeuU2iwzhN825cHoGLRZyuT8ak11IG7S
   YHNDuwiiMB/3Ah/VnE6pukkwOc1aq/Z8rtE6lwmExIjR3HsC/4GJd+I5i
   YK4otuU6NBEX9TMReUCiGcV/oO8F8EQ5gHn8kNpu3mUjynviu+JsSxJJg
   Q==;
X-CSE-ConnectionGUID: 2zLl5Pj0SXGU6TmvJuyEIA==
X-CSE-MsgGUID: 0cE896oqQuyj2FtyqflFYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31527993"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="31527993"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 13:27:37 -0700
X-CSE-ConnectionGUID: 91hlfWN5QMq+K6lQWIka8w==
X-CSE-MsgGUID: O8kBm9WASfypw0PIe+8ARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23728689"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 13:27:36 -0700
Received: from [10.212.69.180] (kliang2-mobl1.ccr.corp.intel.com [10.212.69.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id A2B38206DFDC;
	Thu, 18 Apr 2024 13:27:34 -0700 (PDT)
Message-ID: <ac8835f8-0ea5-4f28-941c-aa43f0da92fd@linux.intel.com>
Date: Thu, 18 Apr 2024 16:27:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] perf parse-events: Improve error message for bad
 numbers
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 Beeman Strong <beeman@rivosinc.com>
References: <20240416061533.921723-1-irogers@google.com>
 <20240416061533.921723-12-irogers@google.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20240416061533.921723-12-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_132739_010473_A1579FEE 
X-CRM114-Status: GOOD (  20.17  )
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



On 2024-04-16 2:15 a.m., Ian Rogers wrote:
> Use the error handler from the parse_state to give a more informative
> error message.
> 
> Before:
> ```
> $ perf stat -e 'cycles/period=99999999999999999999/' true
> event syntax error: 'cycles/period=99999999999999999999/'
>                                   \___ parser error
> Run 'perf list' for a list of valid events
> 
>  Usage: perf stat [<options>] [<command>]
> 
>     -e, --event <event>   event selector. use 'perf list' to list available events
> ```
> 
> After:
> ```
> $ perf stat -e 'cycles/period=99999999999999999999/' true
> event syntax error: 'cycles/period=99999999999999999999/'
>                                   \___ parser error
> 
> event syntax error: '..les/period=99999999999999999999/'
>                                   \___ Bad base 10 number "99999999999999999999"


It seems the patch only works for decimal?

./perf stat -e 'cycles/period=0xaaaaaaaaaaaaaaaaaaaaaa/' true
event syntax error: '..les/period=0xaaaaaaaaaaaaaaaaaaaaaa/'
                                   \___ parser error
 Run 'perf list' for a list of valid events

  Usage: perf stat [<options>] [<command>]

     -e, --event <event>   event selector. use 'perf list' to list
available events

Thanks,
Kan

> Run 'perf list' for a list of valid events
> 
>  Usage: perf stat [<options>] [<command>]
> 
>     -e, --event <event>   event selector. use 'perf list' to list available events
> ```
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/parse-events.l | 40 ++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
> index 6fe37003ab7b..0cd68c9f0d4f 100644
> --- a/tools/perf/util/parse-events.l
> +++ b/tools/perf/util/parse-events.l
> @@ -18,26 +18,34 @@
>  
>  char *parse_events_get_text(yyscan_t yyscanner);
>  YYSTYPE *parse_events_get_lval(yyscan_t yyscanner);
> +int parse_events_get_column(yyscan_t yyscanner);
> +int parse_events_get_leng(yyscan_t yyscanner);
>  
> -static int __value(YYSTYPE *yylval, char *str, int base, int token)
> +static int get_column(yyscan_t scanner)
>  {
> -	u64 num;
> -
> -	errno = 0;
> -	num = strtoull(str, NULL, base);
> -	if (errno)
> -		return PE_ERROR;
> -
> -	yylval->num = num;
> -	return token;
> +	return parse_events_get_column(scanner) - parse_events_get_leng(scanner);
>  }
>  
> -static int value(yyscan_t scanner, int base)
> +static int value(struct parse_events_state *parse_state, yyscan_t scanner, int base)
>  {
>  	YYSTYPE *yylval = parse_events_get_lval(scanner);
>  	char *text = parse_events_get_text(scanner);
> +	u64 num;
>  
> -	return __value(yylval, text, base, PE_VALUE);
> +	errno = 0;
> +	num = strtoull(text, NULL, base);
> +	if (errno) {
> +		struct parse_events_error *error = parse_state->error;
> +		char *help = NULL;
> +
> +		if (asprintf(&help, "Bad base %d number \"%s\"", base, text) > 0)
> +			parse_events_error__handle(error, get_column(scanner), help , NULL);
> +
> +		return PE_ERROR;
> +	}
> +
> +	yylval->num = num;
> +	return PE_VALUE;
>  }
>  
>  static int str(yyscan_t scanner, int token)
> @@ -283,8 +291,8 @@ r0x{num_raw_hex}	{ return str(yyscanner, PE_RAW); }
>  	 */
>  "/"/{digit}		{ return PE_BP_SLASH; }
>  "/"/{non_digit}		{ BEGIN(config); return '/'; }
> -{num_dec}		{ return value(yyscanner, 10); }
> -{num_hex}		{ return value(yyscanner, 16); }
> +{num_dec}		{ return value(_parse_state, yyscanner, 10); }
> +{num_hex}		{ return value(_parse_state, yyscanner, 16); }
>  	/*
>  	 * We need to separate 'mem:' scanner part, in order to get specific
>  	 * modifier bits parsed out. Otherwise we would need to handle PE_NAME
> @@ -330,8 +338,8 @@ cgroup-switches					{ return sym(yyscanner, PERF_COUNT_SW_CGROUP_SWITCHES); }
>  {lc_type}-{lc_op_result}-{lc_op_result}	{ return str(yyscanner, PE_LEGACY_CACHE); }
>  mem:			{ BEGIN(mem); return PE_PREFIX_MEM; }
>  r{num_raw_hex}		{ return str(yyscanner, PE_RAW); }
> -{num_dec}		{ return value(yyscanner, 10); }
> -{num_hex}		{ return value(yyscanner, 16); }
> +{num_dec}		{ return value(_parse_state, yyscanner, 10); }
> +{num_hex}		{ return value(_parse_state, yyscanner, 16); }
>  
>  {modifier_event}	{ return str(yyscanner, PE_MODIFIER_EVENT); }
>  {name}			{ return str(yyscanner, PE_NAME); }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

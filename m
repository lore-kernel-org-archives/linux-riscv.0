Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE54606A338
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 04:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y/dnUh1z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=RRxuxl6S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BLbH0G/dGxePffc7jJgZ9rCLiD3OZdwBWWd4Yj2XRjo=; b=Y/dnUh1zSKdDF42MXys/LGvoIv
	2hEY0lBYtsLI46YR6HEDfE/3Oy7tA49NG4thnx2kvkdubGZwe39GbnReOQvQuypyuyjSJS+YumIYU
	z92olnA1Ab5I77Pwp2oynQmtFxtoQaqvFk15b0A/WyEW9NIR6sv0zscHWwmuJ4ldyekwW2XAzv5b7
	PuUn7m4JiEOfiOiYsFp+MS4RLHqLsD5L/i+HcGkAlWg+JczSxySZa8na5sKPKSI39NiA3LvWtHTYa
	syco+Psy+wb8fddJyX0CFDo1z+vtE9pL4S4gxvPehieR9xpwZZotmLhfcZuKJiVJmZPOU5RvTYJMb
	CCz8xwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdU7-00000002OiT-0Uyx;
	Tue, 10 Nov 2026 04:29:27 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdU5-00000002Ohq-0D76
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 04:29:26 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1b3ada81853so1364959c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 20:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794284964; x=1794889764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
        b=RRxuxl6SIlpxBTl+bsuMxIAhdhTgDoLiO9hop+owa0i4lRdbQHjeK7KkZYBpHDTrh0
         byFv7LzgAFl4g/TrFRrSBNKnPPIQ2EMn8xg1a6PcGzoYlLoxHpc7dIq0qfCf5HBDYXOg
         pHW7AQK4+uguyTLGDHVW7DVhPC9/eK3KQflwQCwf3rx1nj1p5dmQW2xEnE5apENKI6mL
         J5VQvXmzDCdh4UrdZYpXv5iJXStQSpB3v1md4IvsNlvKc8DaU4KI5Z1eOGeWG6o/lG7N
         AW7N9HDikYW38uhcClC7ZdmqO4QCbMzEiImSJe1DC3JcPw9bv+RuGRJvOs9xf/yrteMW
         DQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284964; x=1794889764;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
        b=PDbW04wCWPzHPSs7H9xKKaYy2h1ppAL5LvwNs3zQiexbT+IAKyBy/quzdekGWk7Eng
         zGe8m5Xl8MexIrVOVLaa/bT4Xbm2Xude7WghglSxE8tKKgoWuy7pvYd1/YpCzNg2kcXi
         8imhDsFBfVUYfJ7PEuC8hmBWRQ2z/Eb3Xw1lpjfMawzzR64upp3jFgdOn907tHeu+Up9
         OUhJx9vTWY0fYe0M2jL9MhNXoiEF05z9NzUt8BjHqghDJwCV1JeVj2/ItJyiueSM3hKy
         W4nJD0aVNfd1xNrwY42cdbdWFNXzLq7OFZ6u+2yziJyjj+zHUQWy+eJAMhaMqUyRjMkK
         PLbg==
X-Forwarded-Encrypted: i=1; AL+hErFOeBdL5tBwD1DtRIGCeUC092Q0jeHT2V8oFxqZW4ZuZ0QuDFtPa4HYxcwmq16A90/24ZWVPMAuTKrVeA==@lists.infradead.org
X-Gm-Message-State: APuU4Z93wP0IIa7kvriTvXgDKf8kNHcaqpC9XsyhShlV7nFn1U6pxlS6
	eUeKlT2TGiBxfZguuxwvctcw65USNwosdPyhtZ+6I4j3KlID9sSXQ4tjDnAp2ZHupT0=
X-Gm-Gg: AYBFou0Z/V+2YpdkZTVicqz3P17OsT9m1mY78lxNUUKHnNmFVvx7u5IESIhNNKDqKCJ
	KMEdDQpzhrjDrKGtv0iaPfy8wa0SLGW+Xt3Cbo4qTbNHG7Kz8iY+UEwZuGJeDR/DF3wql7vyfhz
	uTsaOuh2I6JtmNlAg/vWQOqBaQRMTUU9G1VChS5iIM25OunO889crh+AJWZNTVfla2GAKEwqfFT
	NMT4nGceptlQBc+ur773iDOpBpCHHwiPjME/fPlpasKmW0LDXVOmSxkXZ+0ou331ljUDsWzB6az
	0MdV0+XwzcnHjy7EjXJ7Q/B9CkHxRiD8PXmPTCU2MN+RTz/59ViY0UUTZzpxxNgS8HwioRVilKG
	WUjqBpU/rBlXl7mcFNP8B2wYjUbmr6yTjxxSKlcPOgT/5eOXPeEhgJs2xEFE1jT2RV92XqU7eQT
	Rk/HlL14Pmc4B9HxlOQosrXRtIifwVJm0/3r/eF1VdJAaaWviP6JhU5YplJ+cGo7igXu+IFf1y+
	QpNl/1oD71sTIzLoRLRLlmwmOqhA60m+8GgzWDTb1BwDux1zeTYl1Zm0uF6w8pmNA1cd3rLS8Wm
	kt0vzYE8mSrM4OHon/+fPlBfdV/hqHHXfn53OJZajfl0upeX5vRh9dJprQfe9SjErQ==
X-Received: by 2002:a05:7022:4189:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b3b5fee29fmr2657556c88.21.1794284963812;
        Mon, 09 Nov 2026 20:29:23 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm3403963c88.12.2026.11.09.20.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:29:23 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Mon,  9 Nov 2026 20:29:19 -0800
Message-ID: <20261110042920.2108205-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202925_090790_DFD460E7 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mayuresh,

On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp = node->comp;
> +		gtdrv = to_gtrace_driver(comp->dev.driver);
> +		if (!gtdrv || !gtdrv->copyto_auxbuf)
> +			continue;
> +
> +		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
> +		ret = 0;
> +		break;
> +	}

This calls copyto_auxbuf() of the first component in the path that
implements it, which assumes only sinks implement it. On Eswin/EIC7700
pre-ratified trace hardware the encoder and funnel each have an embedded
system memory sink. Whether a component is the sink depends on the
topology: an encoder connected to a funnel is not the sink, but an
encoder with no output connection is. In the first case the data would
be copied from the encoder rather than from the funnel, and under the
funnel's lock (the same lock mismatch sashiko pointed out).

Only the sink holds the path's trace data, so could this just call the
sink's callback?

	struct gtrace_component *comp = gtrace_path_sink(path);
	...
	gtdrv = to_gtrace_driver(comp->dev.driver);
	if (gtdrv && gtdrv->copyto_auxbuf) {
		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
		ret = 0;
	}

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

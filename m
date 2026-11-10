Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D6B606A333
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 04:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMaJBgY6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Zf33JnkQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=whFOlb+O8vp+lh+0uUAmqc3JqEsAqAUxNP9o8tBdH0M=; b=hMaJBgY6h6arMST9iVzhXuFwNW
	WP7LgH4EGWnY6JzVlzSqfMnG4+ZTZvkREBj06C3/jK+Nj+gD8+i919J++80F7R/ntwwD8ajM5z9S6
	QAb8UhwmCieFrhlHTQ0/7M8+i4Wm0QmS+O34UJ4q+baGwhReAdXuc9SXBZV89Oc0ClwqAvw08rm5u
	/kUS64xzTh8dNP9bXkRh7chLKNd0aP553nxkNuiyfqKyIXaXkGm48OuX+yrh2SrIoSUNWpHBUmqcI
	x1mhcKSxgg8k9jsprGLtFY3TIR+45hB1Moef++DDPVhDQLwhkrWj01q/fg/1FtmVh2CQSbJDnfkSJ
	GnLVHfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdQX-00000002OEh-2Sy7;
	Tue, 10 Nov 2026 04:25:45 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdQV-00000002OE5-2L3e
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 04:25:45 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1931ff67a29so397425c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 20:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794284743; x=1794889543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
        b=Zf33JnkQeQK87f/hH599M76eRehdwfwuW/1ahvbH+vjet3wM50OU2rq5NVIym4f55m
         h9PWGLy8Y0HgT2cxdukxo1eBggvOxISliJmJ+LAFWlCEdrk/fpS+DZg1GxFT+O5xUGKn
         Nb6OEc9NjGmkUKNyqRCdvG8lAyN9/43StuItO27r51BrcoKJXa+/HZnxiyzp6zgESXO1
         yxJaSg+IqSsRyq4WhBqBJwr1Kby/KKgXuFJdTYRJ2GRumBnz7le0nvj9LxxwmEnPw7p/
         Vo3YFRuoJRkXZ0vkWoIUpcxQs239Kbrd+0NNwRPvFvcAomRSI0ISvE1F+oUhC3eLehho
         oMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284743; x=1794889543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
        b=IIbFwyb8zHH3d14hy7V38/OCxrydGM3eLxNgbVMeNAVCpFzbfHhdKpvT5BwgKGqR+f
         z408VbaIhLCEFxSeDF8nvYcN5Z/C0KA7JB4E5HcBPavN98dAE6v9+yZ9H2Mc7miT7/4J
         5m/UEfcxNw1yOleVPt9ReuSStvGeyMkrmJOzNvzt8ztA/ri+xj1nOIKbxco1pVGXdVGI
         k1XAPiyZhGw3z98LaO8SjR/3E/3p24hKtmoZHxDWtmqAfdcM64JddcVquA/RQ6XZtXjL
         ltFLj2szm5LeK23vm9SrzkMCUI51Jv1/epCG4S7n8BC/jJf1/JKr55JOag28VW8dGtxK
         WiyA==
X-Forwarded-Encrypted: i=1; AL+hErGCY5btEpEKV7UHzYGRRuiQ29CeqPyNRGl83ZnHUjz7WiIETx56kkB6ae9WeIomau6iITDLKNzQsoyrFQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/6DVAbDXJV1qjK7xS1eEvaSZ7i3ELVGR/hMSxWfJb2vYQk79gT
	+dZpARVfUvxcPHBLyPqCifBH+l8CDpAYcNDi6T0dA5Gm8fvUCS5DR9PBlCA9i34aZ6k=
X-Gm-Gg: AYBFou11n3RcPz4TVb6cQDk+I4nSKTNw3O/nrfy5VmlA4wQPT61P+vVM3KhDk32FQcl
	jruWSpGDn3Kb6i084Sv8SCW0F6xHqgTH1uH7AZw8TJM2ComlaW/UoBNgCRI36bC38xR46dvYJD+
	+9DaysNHEc//QUi4hLyWugwEyz8MWtFLDpWtgOLygltCjzt+2TiVKrU1XJcNHmkkn+MhBn7vRu9
	aa2NsGVKyRrDy4rbaw4cJ6uSkUPL4OwQRWwcvkSZYBZdR//UQ9kV+HxCa8junGI5g0dFm+zKg97
	9N1QzkiC77WfIJyIJ/w2jMWBgzxUeR9bBfPRZn132L1w2WXkSSDUVXSXrwzPEgYTdym/2B6kIQw
	Jdob6KZqWZxkzpVvC07TDm9fbV8oBkxWvCTlcGR2DvQ+hk44quh6Y6sCSehUeK5kS6M27vV9PBI
	Y6Ce5wKHQ7tK8IXUOsLOOTD18C6eXjxVPxYxuqUlU8sYK0vHrMz55E76GjSmuPPeBK6MVHTN7TJ
	yte6AGagjUQ/sBkqgl0dUAOd7Ohw3TAxnDXtDV+LsA+soPcSu33gFrMQLGTEhbLkp2aknjIWOwZ
	ZphBF7aQyJC1YcmX3jQBkjmutH7FFreKV++cUmZqMXRE
X-Received: by 2002:a05:7023:a4c:b0:190:f24b:9491 with SMTP id a92af1059eb24-1b3b6057539mr1957259c88.12.1794284742599;
        Mon, 09 Nov 2026 20:25:42 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm3968811c88.18.2026.11.09.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:25:41 -0800 (PST)
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
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Mon,  9 Nov 2026 20:25:36 -0800
Message-ID: <20261110042537.2080084-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202543_625760_8CFEE73F 
X-CRM114-Status: GOOD (  11.06  )
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
> +	if (!priv->srcbits) {
> +		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
> +			 pdata->bound_cpu);
> +		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
> +		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	}
> +	dev_set_drvdata(&comp->dev, priv);
> +	return 0;
> +}

On a system with many harts it is hard to tell which encoders probed
successfully. Today the only messages come from failures, and the
gtrace_component device names (encoder-N) do not show the CPU or the DT
node. How about a single dev_dbg() (or dev_info()) here giving the bound
CPU and the source ID width, e.g.:

	dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
		dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

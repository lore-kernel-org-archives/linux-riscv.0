Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E5E606A322
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MHdd7NRg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfNixK8z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O0iGL6fz8Kf21afpKWb7oRbtTSMNKPSbOrF8klzdcCs=; b=MHdd7NRgpSdypDNB9pFqMU0PLg
	LtSOzZ4ZCx5bqfmw5rDS3m5RrN6NfGIRD0X58fqBrT5CfCSoYdVjwzCQ4q8G1f/xwpPLemqyLdeNp
	QUv/JSCEDpZqnviKyJGsVSnsyRRrT6/+22bd2Vplofa6uSrrPZoYuR9zXQDJNWARaVJK/Qll1oyvo
	j1NNs7I36p+GKVuUeY0e4NKFoOizA8yBekac4RS+05u8Eo4pk29cUx4ASNK5JLbQNMiZyenqTQwZY
	5XAiX5cJdeU8IWBqqEhJeYPfv2CTEQMgvhWoTunmxSMQR8GKx612l4a7rACNeVFUpwxmWT9FC2Llu
	BDDynFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhG6-00000005RLB-1fTk;
	Tue, 24 Nov 2026 03:31:54 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhG1-00000005RKL-475d
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:31:53 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso2590458a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491109; x=1796095909; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
        b=XfNixK8zczAx5f2jHNKFXaSbRNoedN0ZyTdJFgnkg+2+5OudByqf2RzcRo6UkOpgl5
         l7zgCrRjUF1r3JupBA8501+0MBVVp79VAbuAytLrszx9j+Z5SSVp3TZosrWqrb1VDgw7
         v9NKwtv/pcTbxOE726Xu7r26pnaJlNOIpWnaK8w1wMecwjqJBQKwxPTTRICrhdLHlZha
         Tt15J7l0fKAmHA/uqn3UXTwgGfTKv0r2EYh+MMQQpsz6zpZ9IUEk1FQiB/j6JWX7ELlk
         WEgX9Tp+ypK0jCpaUVDByl6dMcG3J5uNQDzn9oc1kUnauDNXocpVCuEu+hmENZviGEuE
         0B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491109; x=1796095909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
        b=GGOER36PXRvPY7+uWhsEoIGuWOu3uGWNwVzIGf0mrMwW0pIc/ZqX/7ksl/A6pBGEkt
         2+g2PXXDjCuDY0BmC7E1cq6VCYAZBzO36DI25BqQjQdVykpbkGVqGH/MuwsCiMEBeHHO
         fu0Yt6F9WjwAqA7dzXQX89Z8nZNn3MBYYT7MoKTfVZuS1tbO3QyLVK/Q/R9ic058/yEL
         V0s6bzVac/UdVxQPMObUE+/6mPyVQ0Qr5taqpJzgHFvUoqAcNlCB7YvYYFbjM0FAEO37
         h0R6B3rnGec8ubOs8ISjMWi3mF3n5c/qlmF4T9vUkR3EH6pVwm5pfDasrdI3Y6YSiW4u
         3MAA==
X-Forwarded-Encrypted: i=1; AL+hErEvywuZSEeP96mn6EWdsjyV/Qp5nOWPDBDJ9AeWD8BndYXaD17V0JUIl3KM3R25rusiYITFfY4AOZcsSg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+3qhc3S0bso1BQtkDNI08z/PTl6NtTywVN4kfw/XsSd576H15K
	q4C/LHsfVoEK2oSilhVo6dOzDqsV/zihLsfQkEjhc0XlcbSNdlyKmAFL
X-Gm-Gg: AZFdTZcdMPrxiCjGwO4wylIuSf0Lx320vfrA8FM/vId4OCk9anDiesvaJUBE6IFwXkg
	vTCAvGcUT6493EFAWVJoXcOqBPRwGZHbEgoNdmHg+Hk1g5Ed78keImuKvidE869nhrll4UsAXA/
	dR1/GwPaWZL85TLIFJ3ZiAdCp9Oz7q/EtIjZG4FZUGjNGB8LYjirRwDlHR2pU3LAhwKEO9ojPaB
	9Al3GussF9eSlMoBidttQridrZiw4bE3oUrAWxw1MvK0zTqpXgta+u4dFVz2o3dj4qKffajn2O5
	5RP0Y975BxBm+sHr3AKcShCa9kJGXv97tQ8JIbNJi5Fqo70kcUH28Y+ATz8sdBOGahr0CjEkbY4
	AuFvkGhP6Au2d/5NeERBWFbgfUb93tZp9gQoh4B542VwJh9zchiztf2lkPyPCK9vu5HoZ9l0OiB
	fbw3uyJtkxCmncKcD5aLMUeJQzAo4ssAPvhqpB37/4a5T5ZqwoijRpdaWfZI6KzCN1F3xTjDmB6
	h9bc2vQMI07WMWlAC3+8tm72lqylLOXX+9We7M5BFS/SYbQbfhbxb9NNsrvef0HXKuky2q6vmBb
	8McDgmbNY1xYmQ+qu+5se93Sr6kpGyI=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr14048909a91.58.1795491109076;
        Mon, 23 Nov 2026 19:31:49 -0800 (PST)
Received: from [0.0.0.0] ([20.89.104.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm23890691a91.10.2026.11.23.19.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:31:48 -0800 (PST)
Message-ID: <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
Date: Tue, 24 Nov 2026 11:31:44 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Junhui Liu
 <junhui.liu@pigmoral.tech>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
Content-Language: en-US
From: Zixian Zeng <sycamoremoon376@gmail.com>
In-Reply-To: <awS2-clBenE1r1a1@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193150_026790_9267C1DD 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

On 2026/11/24 5:58, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-23 12:41, Zixian Zeng wrote:
>> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
>> 256 bytes with an 8-byte write page, which can be found in schematic[2].
>> The device tree declares pagesize = <16>, which does not match the
>> eeprom chip datasheet which declares pagesize 8 bytes.
> 
> Oops, I am not sure how I got that wrong. Sorry about that.
> 
>> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
>> together, based on the chip model shown in the schematic diagram.
> 
> The k1-milkv-jupiter board is also affected with the same issue, despite
> using a slightly different EEPROM (24C04).
> 

The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
the same issue, which you can find "Page Size: 16 bytes" in datasheet:
https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf

But I don't have the board, simple test would be appreciated. Perhaps I
should include test steps in the commit message for the next revision.

Best regards,
Zixian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E5ECA0EDC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkEesEpuynVvXmtFO65OUn8h0aXGlrHLJeAsdOzLdMM=; b=cMjoNwsgCx3azw
	EtKzoGZjZFfJ4nKp7poSsuAjTKjbzy2bHiYpuHtHBebIurasnVGP+0i17Ou694VT01rNthkHq6U2G
	8tfFp0krkDG2vkjRjauRXKTH2jfHf8ycwc5Ggt+0P6w+2f6k/W5Z2Q9qsHv7gdD9ToDxPktxLkXAU
	F5Ui/CPDCbZxiuwL+esRjwsM/296Fb6vWagmFnP3zptlSoBIWmX9dD4LDLHHkGnDr9o+CpTSaAlep
	xod8pqhy2QsnoU3HBxYzCG95j163vt1AUQpIhf791lB2mK7cWpMRA1oltryPSU6nKxlg1kYWDQHU+
	3OBC1jiaul74l+mgU96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unblA-00000005cy8-2fo1;
	Sun, 17 Aug 2025 11:41:12 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unbl5-00000005cxk-2r5e
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 11:41:12 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55ce510e769so3458356e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 04:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1755430865; x=1756035665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYJ+YmJH/QJFK3QPKh3mCliyXt6+SxftDgDgHhCJCZI=;
        b=Zc0Y4SggFCo78IS+TBjo9FHN8qZk4PJAZwRCZIAW1x0ZMU2dAn6QMVE+1xlTLWaz1L
         FqyIwMWJl95Uz/8SI93pL00Oue8iJsVgnQ7fMr4uFtv4SrTx1rIk9pj2uBz4Z5anU3I+
         xMKqLm4AKT0L04eMxNlxw5LBYQ6bqC3aIYaGWwah1oMQoYpiduubpQMsiqGJk6L9ZiBT
         AQPAW0s57Y8RLMXb/llShMrnAwC20gnmgMoFLT2L4O3S4+QGosmC8bgyNJbHB+BCCdMO
         idHHRls+ThWibWIkgvL60I+ySsWdob/LE4Xx5T19XWcW0PO6YHbCRhELLZbuqOiphGMM
         NUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755430865; x=1756035665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYJ+YmJH/QJFK3QPKh3mCliyXt6+SxftDgDgHhCJCZI=;
        b=ZTxeuin4rKQz8AAhdgoj+XjbLz1KU8FAD5ETt2S1vrE2MESList3XvXDyCeFMjUjgM
         UfDnKOoCJakCgqVFRyFEjCZtyQ00W3QdO901HJJeiSxPxSHSyZuC84bFhbHuWiOnfm+t
         c/CVSof5ePRjEcQ4xA907QBfUexz+WbpNhLHGyeijckahG2AV0Rr6E8WqRNiXlL2C9yh
         gGI4fVn/2xmJkdAQTsjOVpzuoxpWtBU3JCx2D6piSWpZSEcHWQZlxntAcx6IWOjXh4N6
         iQjB461JrwsuaZjgjbF5A7enIUNrJKMvLZk/6g2mLZDnK5zc8W2MtMZo/oqCf3rwSfNc
         XldQ==
X-Gm-Message-State: AOJu0YyfK/V8QALJydrmbSKF2hT8DjYa0TyeJg4eYE5YHM03oot7O7xL
	mm3jO+cg53t50tX6jbBH4Yyyq9QwfZdjCkgR6p1fu08d5m9wGNTc6713tZsnXvaZo1Q=
X-Gm-Gg: ASbGncvP2iPSHPIQ5it2twsAl1y/5z0/db4jPNzDt4YhGd8Fp4hQFTW7a3v8Eop2Z+n
	gSWkYnTi3vzHmLMSpJqF7WYhGhVjAaAVpsJPwWYOfNnr1QqRYOHrR1WvykiHkCyrnZZGcsDxSd7
	PlBDGL0tyVEDPKiMLPSZWH2fzgCoOZBRmd6kq+qhpLaD+HXvFiY/zDZX6F3/C9STD3vITZmw+lc
	fP1Ek83gsSvtcgl6bcbougpfPD179f+5z+dRcRbbepWszZG6bgRWhd5T9pS/prhithyzvJfXOPv
	ceropSyXzlSkSqUS3P3tSsU9vet+SVkYCKYAsUuRtyDLlP2hKbxy0Up6BywBOt0BJEdxD3TqrZt
	mgMCskmSiFEVNSy4Yp2SR+vUs0VLTLY8VoGCOR9q/FyRF2C3ta4dCt8hxOsfMbbkaIg==
X-Google-Smtp-Source: AGHT+IE8dO5R02xyu+qWmBSjeSZeP8c+5NZHdslpk+tly4n/ZsJgKJbx69ZDR41YXG62hz0YCsX79w==
X-Received: by 2002:a05:6512:1583:b0:55b:861a:d2cf with SMTP id 2adb3069b0e04-55cf2cdd182mr1262304e87.26.1755430864685;
        Sun, 17 Aug 2025 04:41:04 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-247-84.bbcust.telenor.se. [92.32.247.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef36acffsm1212000e87.66.2025.08.17.04.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 04:41:04 -0700 (PDT)
Message-ID: <1d962466-dca6-4b0f-accb-efa02a279ca5@cryptogams.org>
Date: Sun, 17 Aug 2025 13:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>, linux-crypto@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, herbert@gondor.apana.org.au,
 paul.walmsley@sifive.com, alex@ghiti.fr, zhang.lyra@gmail.com,
 ebiggers@kernel.org
References: <20250816083943.120700-2-zhihang.shao.iscas@gmail.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20250816083943.120700-2-zhihang.shao.iscas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_044107_731939_93A5DA0C 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> The file 'poly1305-riscv.pl' is taken straight from this upstream
> GitHub repository [0] at commit
> 5e3fba73576244708a752fa61a8e93e587f271bb.
> This patch was tested on SpacemiT X60, with 2~2.5x improvement
> over generic implementation.

Just in case. The fact that the improvement coefficient is higher than 
one quoted in the poly1305-riscv.pl should not come as a surprise. 
Baselines are simply different. The Linux baseline is 9 widening 
multiplications, while the one used for the assembly module in question 
is 4 widening multiplications plus 2 non-widening ones.

A clarification to my previous message where I mentioned that I've 
adjusted benchmark results for U74. It turned out to be some weird power 
management thing that affected the initial readings.

I've also mentioned vector implementation being developed. It's now 
committed. On a related note, ChaCha20 vector implementation is also 
optimized, though it needs a little bit more work...

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

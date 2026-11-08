Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225BD606A32A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqnY8M2z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=G9nW/SDb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yLbYx/mlvZk+ZAYWi33dYjWh3w2ReiBvYrnLKySbvPg=; b=gqnY8M2zGGXDwo5i6CZ1BLWQpf
	j4WTTpInXbrdUYpwGMIns/wE6YWaNICZRlWP4ygU4qlHX3xBkomOmRYdtyYuUFdvWFbRJaC72zRli
	vG9G/O7ev7GYV/rUOKXUODEVOjo3sk2h8xL/HcGjJdBTkAz85yRaLqpR4dU+OF25vVDNFGc4k4XEL
	wqw1FZjjX6cCvLjuhAAfbcpqbSNJLkfV5sWpe9rAmEv0LudhwxDkRtFS8YP7Ot6x/V8XJeRwtm+eZ
	GKCacir1Up/kEnpbxjkI/tUrqNJ/x0o2ODYAqS1E86b96dcxg6OfZnM0/HEya+5ghwit7GtlG+hnm
	gEYruxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4ku-0000000GIxm-0GBE;
	Sun, 08 Nov 2026 15:24:28 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4kp-0000000GItR-2E5E
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 15:24:24 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso68971137.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151462; x=1794756262; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
        b=G9nW/SDbK9QVJkwqUZg/hDWGOYG1F+tt0/vI4Juw1jc3HJFGJFdNAxKzCJoh1JDXMU
         4efiUzxXh/SvCFhFCYDSNZa3TRwK0syENrpVyu17jPmhXmWMgRgEcm/FYEBPFSTCF1hL
         IOumfMexjUqvTeSvMhacWSGOR41F0rPYP68g0Ksea5GGlUZm3O3fOReUT+LpFaQK4b8X
         RmjlR2G7hSixqZ7Ld8IM3Iz4uHVRel44MOUPywgTArr74g4IGdS0NSYz/IguZEmSLcGo
         WIbQbXuR+gY4+ziHORpB9MD6uXpZ3YowK3aYDx8WThtsDKaWH91ESTs3v7jzg5YVDd1D
         StAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151462; x=1794756262;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
        b=GAf+QGuFgiYB0ToJ4R4OyCBa9xZPfOKWyoDTkOvDkDOxqW0+ibSQc0Osynwyxna8pN
         Wl0HBUz/QJbScGhzZrCm+/KnHKMAZ75bt0DOGuH0sNc88O6/ceHA7AvRL781PSQSR/eq
         ceHgh5D6ZbJnqvWKJnSyYv1225vj3s+32MwZK2Z3uKK7NpsC40SJbcFwoeSLPbbDikIl
         ECob2wuE21+q8zhPua8WD+7jnqk2/rqCvHftWdCiB/cG4P1sJnATryYrod2MEQOHg6f4
         cybgT3DqF28XTqW5YQb9nHEXuQhbs9zhpOVhZgwES4J32d7K5zVHvWAXxDw9XCKiNOFD
         /GoQ==
X-Forwarded-Encrypted: i=1; AL+hErGCDpBUKfiMlLjYT7PGc7OaEnazQ2UR5qnNW3QIVl8uK2g3VcIwDPrgmo9Lfh2b74swDMbubWjhuEJ9TQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z//TGxsqUJacPhvf4rrHEIXThS5JH6WusMkBmkHOYWhwxLm4kRW
	J7bWziiYnmk+2eotbstC3VUq6nZ8qCk8n1/+gEEdTaqPrrAf5z5XmKoV99/NcacrMRE=
X-Gm-Gg: AYBFou0EqRLdC1RS4dTgIpxkxvoLJOhpv/jwprGzr+YH5udl/vkKNesaxLoFTqZPiFg
	nd7hkcjAaFtjqMqnw4J24xOrb5S33AEQjdtaiQFGM2kiYOBPrXFlRmyvqMbhrK9QxFfN6mIAyLQ
	TpDVusmxNv3CI0ZrRciKuNPorJ8WiwP1qqftXisHXRxL92ywRGsrVqxYUXHsJQfV1UaQR8hQWbs
	Q5DTqJ9eC3yTC/28ucvQdObt2BlW2ek+EQnmFDtxNFEWRl+NjK+sYr86KQ1/H9pJkhQuoR6zGGB
	YJkqdy3FROM41R7PuG/QMxk2PQ5cMWFPdpiqgb2xICWKzCBbCkMJVpcMl0GZViJhrcL6EjjrMJR
	5yZLprrCN6AMG6AAFRnIm6C4EUToFAUNqaymlkOE84viyDyY077JgrGY+XWh0Xt4fZWTfonnM3/
	2eOTXKZiQas46MAHxnf3Kg0/K3mhkXsR+ED596QTQsu7V50UwTo7QNQLEQaaK9qgt8oKLm2PGBb
	JrCAf7qq/z0KackWDv7+C1t8k/EiI2XyUo+m4xgEQ0nZiizN/hR3FLQylheOKnuIBnF3KbrNmA+
	09qhsbnyMA53yvKh9521qWtBd4Dbr2uA0g4vdOwRRyzi+TSzpVFD3uAmux+hxmRwiwAXu7tM21B
	29xkaaIGelLna+AXGq6dub9FR3rZmv4tAwwrgkRXg9RpiHBny
X-Received: by 2002:a05:6102:d92:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d2daa685bbmr485125137.5.1794151462168;
        Sun, 08 Nov 2026 07:24:22 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/4] selftests: kho: Add riscv support
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-4-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-4-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145358.358073.2579925146371313024.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=2foYgeRjtLhgriBAFewI3QB5zsYy+0XWNuIAF3mfsnE=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhKpBPG9CWddYheCPGKD+kNOAaT7Q0REO8/
 X0Xg5z+ESOJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3is6D/0UINh3QpPKiI0oOOWcH4They0T6KUWUtHH8paLMyiZTEZkaScs0phm5xLc845Ic9LxgmV
 Ob9G+SV8Wxahy4a/rO74Z83XKMVJDWYIpisVHoHivOtAWR+j/G79uLhwjA8WzmN5yO47Bk2nvkh
 ZzBpJEvC9rwTiftW3gZFajEGLRiM49GUVyVv//8qqXJ9Ikppz4DVWRb5Ym4oX6AGzPcIAbONe1A
 nh4nvYGHDQ8lBVPB66a6NO3U6WyIEfh6uZgSQ/++97wJ9wqMTtCfxkBkGLmKL0Yk1AOYpy90QwL
 CDTFSiHMVtve/xrQqdf0EWmvioVf5R+GdmTUyZYuD7pGWDiWkeuLrx8Fp9X79izbp51wQNuYxdM
 JdUKLm2Yg50CclKLaZ1Kfbx5gj3v9DkMLC70EqXxhq5F043Wk9G+Eja6C5cARA3buxzkWeBKNcT
 Ucgnb2XSQM/ctZe6Hg7U78wNzRetTB3KrvVsXeS8Bs4gsKjqptzAokRR3Ta5gTl3eFhb78CfB+0
 0xjt0yhEuEToGjrrg9yY6+cQe1olAah0ZoAIy3V59Ld0EoWxxy3a6V1KwMfNYvm1seTYH704eJi
 iPUZenreJsXOKLLBV3GO4GQh7ruky0RLLEMmdisjXOsYgfKc8xta8jxJJBAUKw1MxbYd41s0ZpX
 dEAw+5VN3pA4i9Q==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_072423_589570_61BAA6E0 
X-CRM114-Status: UNSURE (   4.70  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 06 Nov 2026 15:14:58 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> Describe the machine the KHO vmtest runner needs to boot riscv64, so the
> test stops being skipped on this architecture.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

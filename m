Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460D5606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 19:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NUtALTnF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nnPZGXUj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=peulz5RGETGcAKGdqwRqkVzUqAtO3/FXsLdzP545olg=; b=NUtALTnFkUh4cWYhtmTllg/v3f
	A5nYun92ipRG4UwU+lrYm/lQr9FyzC0L7gjvv82jouVqkTggthY0DEPZFv9q/8PHHHy4RXxycCbJv
	38Z8oOdZJcZOxsHS73QvHi138H2qLpV0n2a7UL+QQQhQmtnkYs+qCUAN6xoMCVjdXAMKGZE8XurN0
	KsOEdGh3x6ePtMN0gV+Kdwfgb6U33oMqA3evD/Cy50OAvvxhkyWqCvFac2FYH/NefZv9E9Zw+OilY
	M2ngR5ba9kwN5qlj4/BIpPHFjxfWJ5VeHMANvJBvrjvu2HmXy90f3EP4fWqOwoLMnVxo1rQJGfQSs
	JvEKp7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5p-00000001cQi-1tvk;
	Sun, 22 Nov 2026 19:19:17 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5m-00000001cOS-3Tup
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 19:19:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so20868205e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 11:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375153; x=1795979953; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=nnPZGXUjOsUaRwBy1946RBCQtPKEb1HMXcclqm+3OmQu4Qe4HAW7Ihl5EqLszl9oEx
         VFipw3oZ04I82ya63z82DhzPuf6OM4kBqw6ud1BInLCYJ7Pxjv+8CU/jH/9AlEZgvytV
         mgRURe3MLxoMi1k4vPAGHpK2Cj2cYO45ibSZNAw1aM4X2IPSd05hySoR4MseTfSRRSxX
         mvbgT2cr2xTz1HghJyIpzRt1KCAAoMS43m44xxLpIbWd4oEck8s665CgwwBqTuIdtM05
         uq+fQvphySqO32dlPhjOuXbKszmJwHDXL2pV2VeCJi43BnlXZH1qUxns7n9HJ3WZnKGf
         lPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375153; x=1795979953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=2f1lD5Fg+qNdPXarOC7DGK9A8Vr/JFmgfYDfBvVxANMOuXB792n6hut+e4NsmRpBn0
         XKaONdbVMtkXRY0LBE2PVo/jiR/y8oAM4KZLASv0JcxAdbMAgizluA7q05gASua208Qu
         tToIfIQHN+fccvWQf+UrL397rSSmjgSqmTxdQkN/ii3D7n4dmF0iwKz173F7y3EsXnni
         ihrAFdfYvR8wSicEG1mm3bcnIjKJGebxV9E5e5dCq5v8iS4jQh4CQAzYoxExry+Qnbvr
         MrcqvKzNbxmgISHjwhEVCzxOBPz67HrxhUHhMCA0Vt+HW4QhFJTqGIMp/gXH1r8vSdf9
         PyBQ==
X-Forwarded-Encrypted: i=1; AL+hErGV9fxmezJx6FkAp7aSsmPW2/qt1a+z8eGW/8jpf4Z82HiKcnwM17yjCPGKQqTN4ZMNL2FDStd2SLk3tg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/SmAMY6eNiXIMImWciRlBy3B0McfYQZvk4lPLHk197sm14LixS
	K4ZWeLVhZUGprH/cwnB/FZXjoOTRGD8KRk3ut3tO7QxP8YoQdsovR+aO
X-Gm-Gg: AZFdTZcWOIjHIJjNkEFfF0Avc1Da+cMF1EBPOSAiGtPwFH5BOv8UkJVmHIY9a0Wfufx
	SxHC8wPcONZoB3MZASy2+iNwlWVpExqRU33MKYxoVUH7LaXAkM3fJ1AXws+nVX0BpBhzw9c8kUB
	5q6axPNpWM4K2V+oNu5qQrzFaGbdI8ypypw+VHjyGzAQ/1Z7XGwav4eLi0Pu1Q5ZbQj5LaBXBxR
	cnx83yAR7qJQdZpmrH7DM3L1fSTNl0LdeSrgwUkkHgA9D6s8M+l81cOcT9K0SzeduqXmmVVYjW9
	xu4UQ19+iNv183QiDpIaCLHw0SREH0zzXeJ6tczpALP3YbUHvZ/8IkABxNl80wCAO+MwKzrSHS/
	9JMzQcCKEIT4YBu4zhulU2DhpHNsWdfnGTIVaAyUZuRA7Qdcp7ayBwnoAFDAEz2RnpiXhL7nWyH
	SaslRWh59+Uii2wxLCkZml+pY3NRsIZWCBMqlN2CyFrTUtlxlnb77DHo5ezxAUMAoKpih4NFbXU
	68EQNmnZ0XcU79h5m5J26jUa+uEQIU9fhJEh2LhpBec/AJEr2Mtfz3NK3P5NU4m8nPZhWUV3DnU
	TBT4uOreSdDIjKau2W++8aI69kw2WNblcmZAfFfo9JZ5
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr192535855e9.7.1795375152884;
        Sun, 22 Nov 2026 11:19:12 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm17465595f8f.56.2026.11.22.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:11 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 4/7] riscv: dts: eswin: add hsp bus node
Date: Sun, 22 Nov 2026 19:19:10 +0000
Message-ID: <20261122191910.2184037-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-5-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_111915_239676_BCDC4BD7 
X-CRM114-Status: UNSURE (   3.70  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

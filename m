Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D07606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kh/oziUG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpvmY1ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gWRhK9z7yI2eJriR5NO2dPpjlqwrQB0XjiaSkH6CLOQ=; b=Kh/oziUG3Y48sAbgpYVyv0kHTB
	phPNMldoBID5ZqGZDg997QL+LZLEfnInTj9pSD/evNmBcp9BaxxSzJlvyu/XNIcTEh+2Dy5Ax/7rm
	qmy39cqdidkpj3j6SYPFCDBnKVmE8mx01YwWPbf79ndRLn7GoVgMbHObmzSzBHpZMWZFPR713Mjmk
	x++C5miIy+V4TYqLYtVMPZ83TDBC3tpjNCA9bizucrgExBKM969SS6y67VjUva2QPH2xO0cCmShuv
	FYAXH+8jKMonpqkgl2Xy2/jDmtpKmrlD1KzjTMguKmBNh5boRtsSr1825En4VJVz/2Dm4QUlPmwqS
	fW/TaMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPjX-0000000Bwqq-33sz;
	Thu, 26 Nov 2026 03:01:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPjW-0000000Bwq4-0ITt
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 03:01:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e9ae391a05so45922035ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 19:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662073; x=1796266873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
        b=DpvmY1ngVcM93JzvUTxoyC/cPFiY7RFTLa/1qvqaube4imByW3nfZg997Z3CB8KKXD
         TNseA6W/Bem8g+JVl87/kNtkAhiMbAIHJWAgD5EpDj/Ck1ipgn7kvprhcIJuCyntZm5i
         mKdQi2wqye1x1ZxP3TZMGAK7MWZo3IewxlpIMoZBv1UNKUfqWNXZWPBISo7u+yc2rtaw
         tYiRi/KOlGHNags8fiLy5jf4TeUiso6UhJbHaMxHiFSWZsHv1Henk9E5+IZ1feAd1tb7
         OWou783c4eWcuvVqWhR2/YxLLZ/itC6HSGFj6zjUEURdew8rMhsgHwACAP8raw2FE1S5
         oW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662073; x=1796266873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
        b=mo2hgWTsMmoidk/KvnjHLuDKvBwHks46fkiyY1GjReR1Smvxkhhywk4jr69NNfYa5u
         vlQO2Hcy27LXQHe4AxeaB438W9SlIpQnS4/V8BgOU6xZONpN7whUBM797HpCDiODtfww
         dokXs96HTplYT0goo+nH60s1avusnJnvS2xfJ8iJGfLVn5IvNq+Z0xekBFEjV3eeyGMt
         vVE2oC9Yka4sKk/mqTWcL24jYeT0xxq3FnRWxaI6EnXMfoumzEbu9pZVMQJ/ymBQ6YBV
         iKrV/9s7VgdMIKXq4PaAbOkSzNkp1PjKQpUkVmkAyDMMxjqxywZsDjY/0pEauVeBr/dC
         0Y2A==
X-Forwarded-Encrypted: i=1; AL+hErH3nRkB+iecNKU/XIKju5JiGGwqQE44Zc6NxPxUU7a7jCrw9Ugu/PVbbJliLLXAeGQs8mllyAaKTZ9tdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/TWOsDBAC53m/sZ87FUAI6nK3BWzgI+RL/HXTUWniPy5eOLgiO
	Xv2Xp+JbA8s6+t4DuvCQJBaV8dL69JDQlnTxUwcdGrEN9u6iOdmbu4QP
X-Gm-Gg: AZFdTZfDIv/OjVbrrCvTlQdpz/yXZE0NoDBJsQ1cVPMI924s7rHcsbdb0lWCH84G1l+
	QbvoMn+QMXcwxiN2+S6qPn+kaH9+VSAGQRAI0w/SyLr2TpvWRjnASY369UlVBwDiQOdDZ1rNDNG
	m4OSlqW1WAXwQfVXofBHaaSa2VYjX3yTMuprOKxdUZ1x8RH9bPhfAJlWrYspftbnlvVCGlgTgzJ
	ciUmX52I5k8xD8JzIYY+U2xW7vAUX0N8cy8Iv1s5umrFA6q5y+3r7iZIU1wzYdhHWImlpT7vu08
	pLzw+QdrQjWrqF9hEctB1ID/bOGmVkDvWf5E5izX1SLqKHDpqAlZIU7J98mx4LmQEUK7INx57vU
	zRKGiXNp8aAgGv4S9XMBaIckG6PoXjkm5vxIBCNA2RphGCjXwXL0VRO93LWjvjb5WaHzwvqfmCa
	BZxwbPW4pNdUPVSRIIGNkgKg6c14LBZFUShSG6o3rF6BkzpPyl2VhWXGwLPvXq0tNpC20KGoncJ
	7tvSA+R5xO4MSQ1dgJs5Jg/cD9+b9Q9XxjbgfYsPUwQ4FpYW3HUaSp2d/DVCYpVv+KFq/BZGTzu
	IhXiIoU4Hd1J6x4+4U/+a2XlwmhS8FyA3SM=
X-Received: by 2002:a17:902:ec91:b0:2f0:d40a:cc21 with SMTP id d9443c01a7336-2f0d40ad46fmr39670185ad.22.1795662073095;
        Wed, 25 Nov 2026 19:01:13 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0d537a522sm24278755ad.47.2026.11.25.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:01:12 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: cyan@meta.com
Cc: leeonion.muyu@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:01:06 +0800
Message-Id: <20261126030106.2543652-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126001920.3185323-1-cyan@meta.com>
References: <20261126001920.3185323-1-cyan@meta.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190114_111664_199F522F 
X-CRM114-Status: UNSURE (   6.09  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks a lot for the review - and for lz4 itself!

That's a great point about independent blocks. v2 passes -BI
unconditionally on lz4 >= 1.9.0, with a build-time probe
($(LZ4) -BI -V) so hosts with older lz4 still work, exactly as
you suggested.  Verified locally that -BI produces byte-identical
output on current lz4.

v2 will follow shortly.

Thanks,
Ping

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

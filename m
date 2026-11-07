Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2891C606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 05:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g4bOu3sx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3iTdF3UH65ap0UECO/Fqih/tIZf+LRo8q7pcT7C+u/0=; b=g4bOu3sxT0yDypRggctQOs5x+D
	1sR2hXAwVlEk4RUULnZQqwx1clrovR3HdSxp08iZD8VMobfHYRxqlRAidSQSsBvOZ1Wo7YIod5H10
	rSZVKE/crV55NAUjLXMuU1MZ4f8uDYewqAZVJtjprHs068vWPtm+29SzJScNJaZwcqmOrpXiZHly1
	3885RVgaO9+Figf3zNkemnf6eSUAZYr39lKu83518a0D9rQS/v8m/HwSFdhoQVKjTlCIxdNqCw62Q
	3WfLiBUzxqjLEIHjqpHB7lfvAnRuCa6B4TeNzjDmTeeQ5HGchgoR64wQOLZMvOKSdb6mAHZik0Asf
	nQ4AI2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZHJ-0000000EFTj-1k19;
	Sat, 07 Nov 2026 05:47:49 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPZHF-0000000EFTN-0R3H
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 05:47:47 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADH1pd6u+5qDwF6AA--.18397S2;
	Sat, 07 Nov 2026 13:47:38 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: unregister the generic PHY device on remove
In-Reply-To: <20261106-coveting-unclip-525e1e9dec65@spud>
References: <20261104021522.1468663-1-vulab@iscas.ac.cn>
 <20261106-coveting-unclip-525e1e9dec65@spud>
Date: Sat, 07 Nov 2026 05:47:34 -0000
Message-ID: <179403045494.2324069.15566749996224490311@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADH1pd6u+5qDwF6AA--.18397S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1xXr1rAFy3ury7Ar4Utwb_yoWfAFg_Ga
	4vyr9rJrs7AF47Kw4vyF1IyrZ09r4UGrs3u3yY9r43J348XFs7X39Y9ry3X3WFgayFkF1D
	tFn8Aw4q9r1j9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
	GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j0wZcUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUEA2rucA5nSwADsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_214745_565072_88ABA97C 
X-CRM114-Status: UNSURE (   5.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

You are right. I checked Felix Gu's patch from 14 September:

https://lore.kernel.org/all/20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com/

It makes exactly the same change in mpfs_remove(), replacing
usb_phy_generic_unregister(pdev) with
usb_phy_generic_unregister(glue->phy). You also provided your
Reviewed-by on 15 September.

I am withdrawing my patch as a duplicate. I should have checked the
mailing list archives for existing fixes before submitting it. I
apologize for the unnecessary review work this caused you and the
other maintainers, and for overlooking Felix's earlier contribution.

I will check for prior submissions and ongoing discussions before any
future submission, and keep the submission volume within what I can
personally review and follow up on.

Thank you for catching this and pointing me to the earlier work.

Best regards,
Wentao Liang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

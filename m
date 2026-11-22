Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC6606A31D
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 19:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VMZDA/8D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTkQp9Wj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f34NnA3zYigjipE5TX20eVrSlwKaRFqVRtv5v7/NSTA=; b=VMZDA/8DMBG+h5B3cjeZ23F4Kx
	HLnVVDMPOMzqBYN0xqVm2g6Iq008s37xfiQ1Z24b/MP1oKKltX4SuEw2rPEJqfQzLhCgQgpgxeSt+
	E0B/uhWfhGKR4ZiKx0BtjECuJLLHetdW/+JByncfZgaOi198R9gKYzlv6JvmdLRCp1GcI2tZAgcwm
	+u7rAiAaDqLDb3Tmb6JT86PdvL9IPCnm2zTfq8RtjqVI/HkLgf0lj8Nn+20kTOlMBoVI5DJ92iGKt
	Mi/pqaaJwyfsl/Qx6YJjSfPyyx01r+JVITB1CeSBuxSD5n66mxh/FBZI79X9P3SKPZ6WXfzO7zPfH
	GMMCJ2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5k-00000001cOQ-3sf4;
	Sun, 22 Nov 2026 19:19:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5e-00000001cMS-3y4b
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 19:19:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1451515f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375145; x=1795979945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
        b=tTkQp9Wjn9V+OgT2i8VuMmsTn4pa84S2Orvp1EOaaCzR/B5ng1O4h5VBikh0s3H7Dn
         NmpNB8Xah55pTMpw5Pwo+W5LdBNhMAecSkzNCHiB21GvqYslqqlO2elbuebhDiP/vviB
         E0WqKBl7b3YZJ00YXWYUPPluzrusZFg3nvWLy/rv12Y8yJLyKhSka0c6f6uke5g1hr72
         K5gvplNStXPNdWlZZ2HiXLsvyvX09ZS5j+zD/gIBSmo0gqEJDJ4pRSxVWLqZq+3LAi9Y
         nduJhbvo9w8zU74YhmEHDkNuaOqVCzYhFDle6M2SIEi/RQ3PMBagjoRcYrBqIHF1zHT1
         0vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375145; x=1795979945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsCFnP3ndBaofMImQLbTwSbFB01O6iMTbveJrzxvAyg=;
        b=RmN1Qx1ueaU+tbUssbGmuA0digKpgY/gcVyenzuAsG7L9nTwE7VTLNRfSzKk3PESgP
         RzBFP7sb9p6ZuilXH7DR43LgXSTKKQxwp/JFrsKqRGoTSxova3TiouJpyvIBcP/8ejC2
         4lZ54aevg5nsX7mW0DQUFQrG4VrLO5UwgUEgwsEDsHW5f/vXYhQQIoz4gahcetUk9waG
         Zh4Qg9hyOyDQAZP8KD6EAgSZLWonflVXSzALuOPxh/oBQ59spL8/LeGOBEZRyG0rhjk4
         ywrMdKC8hW70atEr2cjDbJGcfhQrQuRez0TUo4Qp3giFmQu9UPEVIW5R+VbtOdqatwwn
         Jyew==
X-Forwarded-Encrypted: i=1; AL+hErEIPznsZNRqmANOz2pEPsXwfRuy3GVLLvEvejDsfUJg5DAlG64TBWVS5ISGYg2dPgE5fisH7mrnslnktg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+8vpSfBH84qyvv5RjpH/7sUleI613H6fMOddskAW6WB2Zkzm73
	5/W1yAPaOhISPWJixUH0ApZYkbC/0+0LW0dJG/7KmFRBqyMS351jhHH1
X-Gm-Gg: AZFdTZfnSiKnZBFvO6ctjCxd8kNKBiJuw4v/EHNJbh0hBu5Mq+87R+I9DGpHCY8jpE0
	rH3PUQR6FsE1qwniRrUi4ywNO1Z6PEJuAcNcsUHQCnLLf+kqCezcVQKSIAOhVZ6sSTjA6mK4s4I
	4ii+zd6MIz25/TUHSo4lx2hdDhuLGufca3clncYZApWqoXLj1yfzPJg+mymB1jiLhQvwQxjua3x
	ZPZGtr1PIF9N++G+JzC0cUtcYcO+f6fdoexUF33fhjkoNk8fgZ6tj5y83+mTaKo3eCnn8Uvi2Z8
	ar7wMkYvT6C0E5nnGpKzL7AQySJIshRqkFf7E2Me5/Y6n8gx81NEjweu6GJz6HLD1fVbO7U2I8K
	yBcjkx4N2xUtQpIj7EKF2lo5timMAXDjTPSVAfTW+QoJfCsU5srJ2YzQdW/82bVEvCQKt6zNwJC
	gzIQlZNQN9N2G+OfCwgBOAXDSAyrcX3SlmClAPDhhBmWN1bw6drlzXmus/w3NgYWjVduiVCdcNa
	Lf/Zk7AD89Y5jITZMvFByn6EfR4+PUJHBZrsk8w1FQqf+XbK/rgKjt7YVXsAS6nhcOqvMUF0u14
	xZ849aazPbfzo5OvVqVcGtudhFiE3tNa1y4cAsmpltC0
X-Received: by 2002:adf:e00f:0:10b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-4abb0e4716cmr13169170f8f.10.1795375144988;
        Sun, 22 Nov 2026 11:19:04 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm14926556f8f.46.2026.11.22.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:03 -0800 (PST)
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
Subject: Re: [PATCH v5 2/7] riscv: dts: eswin: add clock generator for EIC7700 SoC
Date: Sun, 22 Nov 2026 19:19:02 +0000
Message-ID: <20261122191902.2183925-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_111908_784547_4D01E4A7 
X-CRM114-Status: UNSURE (   4.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3,
with clk_ignore_unused (without it the board hangs; that is in the
clock driver, not this patch). Details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

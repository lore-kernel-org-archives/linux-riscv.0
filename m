Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B88C3ABCB
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dYmpmxanPxH1GE8omEqft3J4wZe8qyv62RqkQjTJktM=; b=I0pPd/49STNs71
	DbKu4BLj0CvwzEJKDYdtcR3U1IOQKQXSThTY23g07P9bNjmmSEduU667+WcOmcR9HEf0OwiuTetuQ
	gl1rIeAXso+gsMqpU/ttvkzgKvI0ij+/WeRnvrmL2PQ8LEdIxbJrVUjcFrQhP3LDcJtZC6f0NlVxe
	UiA/B1STrzap2tXzrYlreirk0o50uRxPNRiJwFXchSAqMQ2bHlL7wJ75mNCx/tYTyuxVwZV21dxBO
	Xha44E8z/htMfHOSaOaVIblXGPk4DiimtXBqqlE10nxGt8wnc7rwlIXyP+7Kw8OOjg/ZK0BtgDHmR
	VNvuMiTWHKhVxKszURVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJo-00000004ols-3uvZ;
	Fri, 09 May 2025 20:27:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSES-00000004XiL-0Faw
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 18:14:01 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30aa3980af5so3017080a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814439; x=1747419239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPj7I32OmBW3NmJfN6lCorE6OcW6uOYiL6FFTyzHkt4=;
        b=VJD1f/AXwbcSHiSXwl9FMcKkGRQYJtAvV7cKSrU98SZks9y3n3FQZousgSKdq7+vHa
         MSE/Z6/WHtWIL7Io2eiVosr6FRGq9ejw3x8PVLhyJEQW+ggkWTnldzkhzjY/H8jTEAVu
         ZNA8PyFG2AUQw+HdQ261by0uRpyakL24zyOCoXNi6uDBOPqiDr64nDPiv5lbebmCxYkT
         U3d4KAclfWvlO3FehUAmtEETIhjcZOKyxza8whPCpM9xJQxHOBAjXzbFuKYmC5Gk3HSA
         CjKoE2Ukr6K/3fnnnU/aIAqzEqyTPOqiyV82V9SUPqzH4PODN+oKFNUwhNjTYqIJCMlU
         mhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814439; x=1747419239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPj7I32OmBW3NmJfN6lCorE6OcW6uOYiL6FFTyzHkt4=;
        b=Udlsnmhn3ihKmHE7R1ApvggsRBs/jA4ebHcAvR5Q0D6rfPuStYKpFhHe1wXYghR1nd
         BN0CDatzAbZ8AeYlXr0kmWlP1VGq7ZT54+LZdJmmQ37JYLZ14bl1/pWc0lrDnSVn9zvd
         oQ+w5KWknkmjIJzesLNIW9AbHHR4O6KulFQP+NtUTnpkVKHBnY1L99kKzCI+hblokwUR
         AIyRMAeqUQ1/z2fgz8736gFOZrNq+BcwVzdN+Yn+ZrdfB/ER/U2ioRwqwjrZA/b7Yf+v
         YZWfbAxCpC6K85DlfWZJ2BKMLpNo8GWIOID9q8cA9h5b03xDdVVPZF0MjZ+H0EXyYl3i
         Nang==
X-Forwarded-Encrypted: i=1; AJvYcCXAHiLLVSZhZPQUSBkZ70Rtw0ssNFVhhnnKFzULHAJBaJoLueeX+iKJc03wqqmxHMZIzgO14ecff+526A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/c1ZEeY1geqHOeIxkp3UNFw0Ic/UM9z3SaxeQRYpCCYwRfuzw
	NQUBhkYEtRJAoAHUwVjO2umkXzuLsoCE1oZQjzqBXu0G/Tr8ftg9
X-Gm-Gg: ASbGncvJx3f2NJpXuAm/RIdlOAyU9qo623jiM4xSrcKUBCGO93Gu5nkFaQrZJghRn7g
	ohKysUlBMLZaINgPg6Wa5Lzyfs2ceQYM0+Eu65EYz7eGnmySWCSegNTyr0B5oD/h7pnCtyuuosR
	apIVHAT/qjcGj55sFq2dWhqfHNRrYzjmHdzz0nrwG+kejj/39+1+9N5qmzI9nLKEPEpirj8N9rg
	jCq8VZOEiBndWo89rB1A0ls+JMbVsOZKzAm88rTm6puAXeqJ5WtlObVhgUw2S3FJ+JfA6x3ys29
	e0v6GeSYiSCmUh5xOjtQVrgDjOaafbWD9mpYI8qecO9RXYXEnzbyRXdd4U/7TA==
X-Google-Smtp-Source: AGHT+IFfDKuX+Ogqxn1Bz7Jth7H250NjxWVtd3CHGpPWzJnTEpjnMQCpbk5yL8+PxsceCiC6uJchgw==
X-Received: by 2002:a17:90a:dfd0:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-30c3d3eb4e3mr8275448a91.18.1746814438302;
        Fri, 09 May 2025 11:13:58 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:13:57 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add Sophgo x8/x4 EVB Board support
Date: Sat, 10 May 2025 02:13:26 +0800
Message-ID: <cover.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_111400_107339_6F7BB866 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sophgo x8/x4 EVB [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (4):
  dt-bindings: riscv: add Sophgo x8 EVB bindings
  riscv: dts: sophgo: add Sophgo x8 EVB board device tree
  dt-bindings: riscv: add Sophgo x4 EVB bindings
  riscv: dts: sophgo: add Sophgo x4 EVB board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 .../boot/dts/sophgo/sg2042-sophgo-x4evb.dts   | 235 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-sophgo-x8evb.dts   | 247 ++++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts


base-commit: 550de367614f7a9a0c1d40d7e19764aa9305009a
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

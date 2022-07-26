Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDEC00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=An5ijrNgUANypuJyAc+pBOYCi4iNad0euue+GYw9/1I=; b=vu5lZ7nfAQ6fot
	lKrKEx0+RLXhSntJLXkNnjH3nqWRgyVV2zzD/xgrkFeJRuFadHTtSidx9LOMHWgsjbJ+HLWoZ/WT/
	5IJhbSiJX1LKlaY3ULOi8VTNFMT4wPvLEtwnEobd029gR7mccsbQBILtkjxOHt0IrMp4ltYgPwp5i
	MkbI6YLD7wxl7pY5w1dIyQAxjAr6mrGBsk3KKP2Mm4sp+Ce6Ant8+r8vpDDgfj1c2vIVDTnYP8i3S
	SttRONXv9v8+uhIaVFWqJHSELsISAx/yFOvpRHIk5XtALSaSZ+XrZjmUVAzrdFKVvygJ9zFJFivjx
	lmmJ/L+Vx5xnfD/Sftng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGO2Q-001GDb-2e; Tue, 26 Jul 2022 17:08:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGO2L-001G8c-9B
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 17:08:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id b26so21060208wrc.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 10:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqEbmzhKx0NMjg0VvinCoPEfypWpQp7BkQaC0Xs8ciA=;
        b=NhvjhaDnJnixTK5JKS13CF/cGWT95PlYz5ESq87WVqMG6WDROqjbUK6xqAdGJULCpz
         mZAEIbbjJbwrPzrktT3T+hs2SojuMjASB5/5RaZoK38FRiqIXI9nm4IqEXTYfpBUQxtF
         OPtgT59X4RnD04NW5HDTK6tYnDxxB2LsL5xk2MnnjXPyXCal1tupwafaj+/mzZ6Fj9W/
         JfPOIe+myCgsz1tzJGLmJmP3pdNNjuat7gTHpEFrvR0In+IQ2op4pUbfhe/IF2sD+2gR
         IfxFyDXvhZ3ePvPndTkPjf9k+OU+nebEjUnlZWBsRDd2q5POSB7gmnFOjIdy0UhQpO3n
         T4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DqEbmzhKx0NMjg0VvinCoPEfypWpQp7BkQaC0Xs8ciA=;
        b=Q7niGcL47/DGfu1vvZvGCeIXu+V9rZL7KH7ib3IX9MK3hqOMcT6ba1CxxL1mveNddq
         eHh5uxrs3vDMf8fiCUTDoWVE00nVVxPwQZA2kr1uZMJeaHWb7kXN+Qli0Z5oz8PlS/L4
         ZQQJFTr5wmkO4LyXzAg9rO58ZxW8sXpNJ1GtJ4nchQttSaAZLO7S4KM6T1m18wTfn379
         SIHZgaDXs+pyE24Sr4WCqT3++IMUgQWYii7KaY1cXojoMFnjMpdMv/6I/9Rudn+z8hrh
         OpEjjSWHZkjfcM3veml9UjJ8DQNk1AzZyjBXxAcML9Wgt+LxmmwLoiSmn0cmHXgzIGCr
         VDoQ==
X-Gm-Message-State: AJIora8SV3r5QgOzr6KD7m6c4/C7jOvpLGEl8GqZFKFZG4p3EFGr5zef
	QQrYaKRKDTMiYfbQVSW0j6j9ig==
X-Google-Smtp-Source: AGRyM1ujJrahHNmwiwz/mBnF/zHJW0mN4KLDNf4jcWEuw6EW0rtMpqQBl3Uq7RHHGJqWG90H0YU3xw==
X-Received: by 2002:adf:e193:0:b0:21e:626c:d082 with SMTP id az19-20020adfe193000000b0021e626cd082mr11227518wrb.159.1658855276724;
        Tue, 26 Jul 2022 10:07:56 -0700 (PDT)
Received: from henark71.. ([109.76.124.168])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm14859618wrv.94.2022.07.26.10.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:07:55 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atul Khare <atulkhare@rivosinc.com>,
	Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Fix SiFive dt-schema errors
Date: Tue, 26 Jul 2022 18:07:24 +0100
Message-Id: <20220726170725.3245278-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_100801_375694_BDC34DDE 
X-CRM114-Status: GOOD (  19.30  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hi all,
As these are the last remaining dtbs_check warnings for the default
riscv defconfig I am reviving the series. Atul has been hit by some
hardware issues so has not had a chance to send an applicable version
of these patches. All I have done here is rebase on linux-next, so by
the time the merge window reopens it will hopefully apply..

On Atul's V2, Rob had a comment about changing the cache-sets in the
patch 1/2:
There is not any way to express power of 2, so you have to list values.
Rather than just adding 1 more value, I would add at least a few more so
we're not adding these one by one. This is for a specific cache
implementation, so it can't really be *any* power of 2. Designs have
some limits or physics does. /endquote

I don't think that there's value in speculatively adding values to this
enum especially as (I think at least) the scala for this cache IP has
been released publicly:
https://github.com/sifive/block-inclusivecache-sifive/blob/master/design/craft/inclusivecache/src/Parameters.scala#L32

The two compatibles in the file match only against two specific cache
implemenations: the fu540's & the fu740's. I would seem to me that, it
would be better to lock this to a single value per compatible since the
1024 applies to the fu540 & the new value of 2048 applies only to the
fu740.

I have not made that change, I simply wanted to repackage this series
in a way that could be more easily applied & restart the discussion.

Thanks,
Conor.

Atul Khare (2):
  dt-bindings: sifive: add cache-set value of 2048
  dt-bindings: sifive: add gpio-line-names

 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 4 ++++
 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)


base-commit: 058affafc65a74cf54499fb578b66ad0b18f939b
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

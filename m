Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781C1606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nAbClIkr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klYch0Li
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PK2HeSY7qyZXWJyCMcYBnUo0Vi0N0jK/0jvIdzCwXk0=; b=nAbClIkrVbboxJB3Ql/2qWwRS9
	X+wyGSajmOpVZ2wkP+sOmoeASwBIORYBUle8fvV/fPrMPgxG6fEcon0bC0E1K9lwZWchcC8u0ZHUe
	XKLosWfoy40BFgtVWJMhHkJarHX8qRNci/98CVstip+vFCLDO09OLKMuc5sWPd1RGB3i4G6QmFaFI
	a59wREwHy64Aiv3WD9P+kxitLhVvPuDalMV5I+HQpoyFaWuKEZRh2j1FtBp493Pe6vzsudp+nl1qn
	OF1Fh3QdJNY0LL4jsI506qY/g+C5QFHN9WSFEX+FS4UxyWjqL6044880flB7uW2aSsFqa2L355EIw
	3Yg/w2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWp-00000001S34-3kWF;
	Sun, 22 Nov 2026 17:39:03 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBWn-00000001S1D-0yBE
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 17:39:02 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-38644aedba1so3493792eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 09:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369140; x=1795973940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=klYch0LiZmicqclw1LxVwF68XXYQcWZiXHYj9jW8cBHJx826TfGqzk7MDVJhcl9ten
         1ZdV8RRvBBbe6KRV+iTeLfnxwm19nA+LNzuBp3sINorHh20dCuAuDhbx5BO5ejVQaYkw
         xCdfXZuhWkuAisygb58qQ5PYfwNhPKNyqwHGqUJtAsJlR455k0NmBXIOAiBKQz0Zfcy/
         xNSnKScukBUt+woCdbIcANWgd0cKwvqObvDmx8HUjlAT6vXwUzMnXPOO4pyv0EqXDeU/
         a8d91n58x9r9q+yoxGzM2zNqhDOSHN3pzF+wb1TAnAEkj53aJxj8pn/EGG9s9jSkOOwT
         G3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369140; x=1795973940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=QnxZ+CT5cU4khZ6T7kbVNB1zswGKEhrEJE865wTm5zfctxZavtOebUR7c+uTGSyehR
         N8GtGzVvGSMM3dczJ6dqmpJD2bskUG8O9RpWa4wXlKr2wllkpwncl8TIQmbT8ffYw1l9
         TeXgGOhKH6Wf1L626h3I9mwe+Wf9vf9nfrCo6v37WjpUJpLgZiwB8Yr21PkFOyyQNyzF
         fR0K6563z60CDj9MlFv5JjjSj7VilJGYxMCmk4VcGLsjrW443l5yQ6iZhFKYo7zfQA+T
         orh69EKN50k0V3Hp+Ead87VJFwDdLPCBy8RJ7SuBJcY2dWNkIsJgSQ0ua9ZpXEKCAQTL
         KfYQ==
X-Forwarded-Encrypted: i=1; AL+hErEmTCHMStJ2wDwqE3RBg6PAYNrL8D0mC+0FazDArZbcLV20eb8cSjHX99wTLtGywdVKmoflkkWlv29Ttg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/VCIW0Ts7vCSXnUNzYz030+VC9nNJvIkdaAhFPJgg5haPXYHcz
	2OxzZpg9xtbSAUrPCM1mpvRUrBEZ+nqKurqJX0IXdzPB9PH4N8v8UYm+
X-Gm-Gg: AZFdTZeKfaZlLFC3/IztSQSi02rAWgCV68gYvmuDNwuOAta0LApmHDcn9xh1Iidluz1
	59qi27A9OMGNZwnmWf63w5puNg+OCsQpCZ0+h3yITFXkbX5pWyCt9P74/AAvnEfV+Qta46OzKpt
	1mlhyn5z6Ls7cdXoRFaEC6HH/jUFOB8UZAB0XhE7h2Gf3HpeYu8SSTlN7imUTdwetP/gP2PIrb/
	tCxsLqzDe7dqZENFD+4z//yFRw4QeXVqv7qfMW42OOPrzifhghq/1uDd16ohebs7LTj6YvmhJ0t
	NjqJSASyh+H+hrBo8VxtSk+jouObTDtKmSY0gaOYqWDedfIiVshK0DfqJcaBelmPJxeuu/T4xgj
	3eVnsVMYavuuhJOQ8BHPqZxoOpYp1W6IX0v0VbI9fZSpajhT5GzRTCsYxzmsN0jOas6WVph/+xH
	5JvkyWp0g8A1TmwJcykhZfdRor9n/hwI2SeYeAwKfunk2sS91jalwCJbUJX4z7hjnp282sWtMeo
	sabt5s8iLYkZyHN7dc41y8XC4wbHsHCLWy2z/qvHqU+neaak2Ho/yhDYCpgCslrbGQUGJI5eGyW
	OlZ00D0W7RRP5chKaDlMB0Xn/B7atX9dQrPREHu2/h7koSJFxA==
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr9545686eec.16.1795369140294;
        Sun, 22 Nov 2026 09:39:00 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:59 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 23 Nov 2026 01:38:10 +0800
Message-ID: <20261122173810.2409146-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_093901_275156_FD9E29BD 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.5 (+)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the K3 eFuse controller and NVMEM cells for the temperature
calibration data in bank 0 and bank 7.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..af1a758788ff 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@1c {
+					reg = <0x1c 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@ea {
+					reg = <0xea 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

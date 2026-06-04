Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B11CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQtkGdUkZvDDfsTXJLBbwIdbVSBMEmisqGXWG6Ujudw=; b=MlF29bHQSvv/HR
	IEhB8U/Je2X7JYEvImdBmOqKkz0zHM9AWn8zQBqhyv1anZjH1qGb3uMMtFTe87bYXp7laYSVeWirg
	Jkb7vWngmRmLRZJmIFpo9iIx8Nhopu8LT1hmlriPD4KZyhLaSEN0XUOU33EaVTXr+Mmvq0/+e0GiM
	zuEfOdQkFgK8MXzoLr1RHiRpOc9hDwSACKHfsWq54XjdEFVtNzVlMmvMtXc8pD/snywBGIeZrEmGy
	UEP+d59higl8Azh01fTsh5QxAXNYbmCeqg4cVbklY3c0Fg0WexjmwC/drBdi2qU0rK7snHjkocpNo
	WYtr10GZ9R6DM7s44w3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9GE-0000000GvIJ-1Fvg;
	Thu, 04 Jun 2026 14:41:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9GC-0000000GvHG-2XSO
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 14:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S7ZZvgDuAkj0R9mp/h2dtgYXrKsMrnp+U6EM1fwkkp4=; b=hwTslb5eOBjk7bow2CPTM1Ea+s
	RO85gjV4O11pwtMI1RTqYmLHxZRsYI//SOBpQrjbbyUTd9A4x3XSyiwSq6W9lFwhhBSEXZuXjVMxo
	WfYdnd1iiEdAUtbUwbxaH3iwYhWiCYHss5pVCpdf4gVkn2FILva4r9box71MrmjhDbVFBqtFVm1Fd
	7mbYfyNsPJGHnsY6djuifr4IYQQt/tc3UdJh69myZAmq2JBraKZQS0SbZvAFhuSpWBaztK/BeHmni
	6E/AO/OQWwXg8qTmhLosukqjA4N6ev0Xsq2Dd3uAMAZxSdS9KE7htzs7TJIiYdih12nnRCVADB4Zw
	+jGWBbKw==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9G9-0000000ES9d-2ldV
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:41:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-842358aaf36so359495b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584083; x=1781188883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7ZZvgDuAkj0R9mp/h2dtgYXrKsMrnp+U6EM1fwkkp4=;
        b=X0cTteaZJk5Hs+4qIhIp9Eg8YY//aFKjeAeflxS0gsaeO2BqcflyeV9hzQF+12U6NV
         h1nJ0JEi3eYU31Rnx/9pwlhf79KB4elgjuz/7vpBc86bGlS1GqW/XFp/yDeIac5HCQj+
         CTMw7g2/dNVt/fQMzmYeBxBcYXhgxE43xL22iOAzC6fLujxtqbpJIq4IHbn5ekcezsdL
         74p6Qd4IidVNiQ8ulsk8b+GFyH9Fadh5Ip0VPRYtzREElUkVvfHstAsx3DlykS7Jx1dN
         xYGcekrPFAsVVYiztbXBTjC/CCBKoZtpisB+hCBGZCnpmCJ4ZoXaKXNBC4vmTQYZKbTx
         Lf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584083; x=1781188883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7ZZvgDuAkj0R9mp/h2dtgYXrKsMrnp+U6EM1fwkkp4=;
        b=ixLgcIqRbumsiUAgsKTp0udq9OhrE6CgjMo7CxcJRVYvZA9MlgObOZzHc7hMVHuRAN
         uCKueOQ2RQPuEejAEQRp5QetX/f5blXAjH4Q0qaYt3K+MmmpPRLSFi5sE+rEfK8ThN1n
         aADv/vlm5wDIVeBzeDuRlZXVjafxVWASA3knG6tARsbv0dIFlNSHTC89ZA0ot4/ZLgAO
         jqM+09JO8uptcYsRbYv1LBDdJik64qot3IIwOoddWtVEuWvGHamAq+eOfA4JviNcI8/1
         FJ7wmv2e+CTMM1tCqFJJMuvsyKBAt6kT9RfUkoR6uiIO/hRhLzgCbLeIyQ74Pr13WvT9
         junA==
X-Forwarded-Encrypted: i=1; AFNElJ867OaGO0EHGbNLlm0HykteYLIpid9yCpCJ1SDW5Zngq85Io47bLEYbeIwWOebl6h2gBe2f9AiBQC4BPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLg214lKVIesiTUlXZ0V3M3/m60muW/kV/OEPlphiwSwib/Zi3
	wNtsf2odKr6T/Df5rlC+xD3/TU6Kxk/LqjqVpda8zRLJgEpfwgpd0Oxc
X-Gm-Gg: Acq92OGMcpdoIKCoIGvT2RWijcpZ/E6toesVrbmm0WRVWsFjwKG3clSnJNe2HyCm5Is
	m20E9i38zdmiPucgrho7IiOfOtzZkNf72QvVUYXfp1Ox5GqGJaGV7gaHJl46qvt+BFTZ8kSaMSP
	d1NmKDoXJTBZzICSSU19kVRLIkIaAj1vefRktZrqQf9z/7LmBdMv5r2/BMiIWic/9j9hWy8q3wn
	VN1zAYkb3IRbNwNrLqHqq6/B6DrVQL0keN+ZR9aaVewqJ36Z8h+aRuyWg0E1VwICCb6ldL91El4
	DdTBdpcpNloRRKdh/BcD9ySA5NbQM1siy2NEKdlT80kZlnFD8ptP7hme0oKIy+WLcp02mgrplC9
	bnD4LPZ6ecJobIeIWt5gbwZo2eu7oYjpTsh17oVD5HtW0vcbu5XuB8cvvSe55PGUuZExjIHWZd7
	nQ8DkRFpMSfyqX0TVtrYzo43O2IJ5ytAVQc+8YWAL7MWSGwPU/OZAh2kYuT1cPCebotOmXX5Kkb
	tcdsWBkoDRZZgHZ9RXBajfjKcd6WyyUkmTCPbPsMP5XfBI1MFY/NRqIH331KjgpX29BAOIuccw=
X-Received: by 2002:a05:6a00:408d:b0:82f:2b0:2809 with SMTP id d2e1a72fcca58-84284e35c75mr8188412b3a.1.1780584083550;
        Thu, 04 Jun 2026 07:41:23 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Fri,  5 Jun 2026 00:09:52 +0930
Message-ID: <20260604143957.668047-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_154125_885514_F1046E6A 
X-CRM114-Status: UNSURE (   7.71  )
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

Add compatible for the Tenstorrent Atlantis platform.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
index e15359b2aab6..7fb640e38455 100644
--- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -22,6 +22,10 @@ properties:
         items:
           - const: tenstorrent,blackhole-card
           - const: tenstorrent,blackhole
+      - description: Tenstorrent Atlantis
+        items:
+          - const: tenstorrent,atlantis-evb
+          - const: tenstorrent,atlantis
 
 additionalProperties: true
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B86D606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a0cdvYja;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXuC20bK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E1sXJZjuiTB0IKVtwHijUT5frL2T1R/AEBKu6gV/Pho=; b=a0cdvYjaAV1yrcNyQ6MrZb1bvB
	fulP55xj1mkkn/17oG4FIhlM0nuxLjG2+elpBkTUo78hDVa6q+thSlZHgtH/9pWIqSVAg4bWOo5Af
	O9jsfU2+YY4od/C5Df2snDSAbA1yCMr00H89YtV63Mg1XDTRaoI29DMlGPqEr35aGRgcJgOiDj7KP
	re9zSkdjr8s3m9SEf7fusWdIwf9E/BZpaRiNSV+EV2zvvi8z/RdjO9Z25WfV4sDzOEY9fpYMAscUl
	jgZ/ul7aFGwnf3PIvNYmCq5TlIFUQ2DqQfrCgqTtfer/OlC7kpehH3k2AUOWZTaS0W7mvPz4tcZHg
	ULkeC4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpGG-0000000F12f-447G;
	Fri, 27 Nov 2026 06:16:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpGE-0000000F10Z-1Nlk
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:16:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f0918f9e6cso22337795ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760201; x=1796365001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGhMLPQFKL33MgWxErYC1jx4qA3xULUGaPqxhcEgn94=;
        b=HXuC20bKvFZ4eSBHyNVTtWcFh0OPsYFniKi3h7qComu/81o+K61t/1/qcUVfVKuUhX
         pjJ+Dmai+yJ+6HfcmYBZGu2J6OjrJ8txlUWQ8HWrkKc7jfyfD+I3NNAND2aQTHtu68s+
         kWgSuY0dI3It3Pcc6PIDzNscfCrHkb2LlUfJS1IFZvMAM8zDQ43FzHj0pJc9vWI2UVHW
         Hm9B02iAMDlFwb/GEsmYKqL8HvoSO24G0d4o1/js8ODi3NS4zhGA9NjCh0sIPyDR/gKf
         hgbFbkE5f4DanYCcwXUWKIyW1LtpSv8voDU+MIgHLxukP6AMWWOG5xNAiA7eCAX5A76s
         BRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760201; x=1796365001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGhMLPQFKL33MgWxErYC1jx4qA3xULUGaPqxhcEgn94=;
        b=X5aOUV7g8sxSE92S/x5wzpyw7yBArDVhs2OPm+2Wk6HVOJMKsHzMEszJnDj2VwsVm4
         mVQXEVbUaJ4bXkkHdA9zoFhmzcUXGeELKVGMJ+0ZY6APXGpZ4/JpKJXdyCU4fP72cTuP
         8geC4zPy19syBMDl8pV7YrW3Ojjw2JFstVDkA8l+uP8JXEavuHPbs15WTOaFRhIvoY+G
         zcMPshOb3jRHAIeqZsFD4n3qcc8cCQSGMVPpxe+X2VQWwdrcKWEThSN4sm63UdHaoDbl
         CkLIDuf8kUONYqKpjk+cLmJwQujNkxC6mn7BpZ+ISJX2l9zzY35P8twVUQc5QeP8q6nt
         bSVQ==
X-Forwarded-Encrypted: i=1; AL+hErF8x6fgcJubzBDHlFzcxGfxuemqUj4jQqCh+1ftC2ajGmxqm6GIiKju1oJ//QTXcTjyX5MeCaicPe7ccQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9COVOcYmWb9r6vkXolMnnzebnOjfkGPx+a3Jo6lOmogUbSwqRk
	Klvv/cN9ySZh1KsfUaoleEZB4qe++VBrZ/JvCZh+JNBnHLI4mBjzJT0C
X-Gm-Gg: AZFdTZcj0NB8nLwcrC2UkaUreS3e5slyBJgE62PCBSUyrucIW3tOponNCGCtRMjHeuZ
	oqFUE2Nyq6AUjwrQ9p4ElPVwVAMrmdHkCIjOIQ6NTL2UwFBDMUqWPRBQ7HIAiiw3eog3hwStv9F
	l+m3KV+z/OrBu/zHA4rgbZcNXG2x1eBPGhKytrM7EkG+LyB2BvC5UU2UX/EpECF3Lo77Eom3ZcU
	iGfIuLFovm0R7dqUwkigX+n/cUdaTO5yF0D46+9o8pQ8hwXjYGxvpt9saQSOLkFaVqQ6qetrSn0
	wZP0HSmXRebmpXByNOV0ev6nG7Md6TMfS+Qw7QxoVdoTi1K2ltXtML8bjfgHSnOKWgj/wFlWy9w
	+mxPpZfIwCqnDZ25eJ7QtRQK+jS/0JHBny4X/no48voebVKzlUYCfBeQ4ReuSiIl6N7o6ctVpwf
	ijJLCaiaGyiB+oz374lk4bCouUuNrZm96z8N28ZdH6f+8bUrC5nVf1y6HfmQOWnZWJ9WRZN8fRD
	vzg/CAaRyzn9I+JMIw4LUt5InTuiftiSCg6am4eqG3tPGL2ZWsrKTx3f9aOkwRrxzQot1TFa2HQ
	TIqUQabgrCfg1Pka0tQSpd1WfVhyB7xEZbz/P8F20aVkE6pF6yNcc16fXWtDSQsei7qqTlWnJch
	Yq+B4jJcsCSDviTu8R67yjQ8Yz9BMguJrC2zq+dgHPnBNbgylfMJcZCjYW33/7Ws=
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr213846735ad.3.1795760201296;
        Thu, 26 Nov 2026 22:16:41 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:40 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 5/6] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Fri, 27 Nov 2026 16:44:25 +1030
Message-ID: <20261127061432.17306-6-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221642_368259_6A513B25 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add compatible for the Tenstorrent Atlantis platform.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
v3: No changes, pick up review tags
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

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC33606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BTdnLB6R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzlnjI0J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kT0YUE1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b+9lXrLa1sgrDy6yxp5RMIkNji6fG3Sj/IEzk0T3xrk=; b=BTdnLB6RJu6gJ5nJtroeVpeWGe
	E3tzEFZZCa+n+ctpZgoQ255jROogF2VIiuVm/MUtTtxr1+OF9hSzA5xYAybGls8HP+kEv9xSS9dvd
	k00qAOlpwDmtXgMT3hOeOWgueykefw0J9WTIcgM6hLPyBLMOPrL+j5YxcsdfrvBH5uQLjtuw0tiu5
	ZJRnUvbpfrkqjCcEFBJOr6ohzHJO+w6kVl0jaVS/uP2wQ4cf5WXyuTY4Vxn8vKqNOd/FJFiLwKzui
	eC6Cio0TeGueRVfTjGzT2Kl+pY085hLX0fXOYuZWdV1/57sEtnqhMWxR/iF2mxuxD7vPGb4kM5+a6
	juNY4B1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPt1-00000009HTE-28GO;
	Thu, 29 Oct 2026 13:09:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPsy-00000009HS3-2cR5
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 13:09:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeP1v3215074
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XFgV7hQHnaq
	B3LpunHXmA40D5cDU+9hyfeWDV11nSSI=; b=gzlnjI0JD3BTnchNvTSWFHIyEB+
	0+tMXKU7Fd1z2nbjG0g783Kw0aKRHyCF/3WUkeNLH3EQ7Q5LPGhIljqUrVro8j/g
	3sVBzqUPEBGgXewhRP2BCpFA5nwFsuwnd6gS2aa8ebwJ4alSr7891ak0FVD6sIlv
	lAvmjdsGwsdLGMqEhK6q6+W0NQQ/GNrReFRehKhuUd1gbWrbGkq406CTFXT+vy8f
	2YjyIF2pyvOFWyekE7EtH0+ZbtgSH6RvhuI+a65JDkUdCRR++5ezKdLC7TFFLeO4
	BLDMeHYcOIRN/WZe+fXL6w6y81VyihJgsDhWSLQJTUdtIDmt7BkWKG4GTyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s9t0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so2063330a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279379; x=1793884179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
        b=kT0YUE1f+RLk6rri00MMEw3DoSzfWrrJNt1juMS/yUOgUXCJxmrJMUircLg+kzNSMN
         DdA8f9M0UNwsXjPsk+dAKZLJ+4+d+0Wa+yPE2nzNDs6P+E+HrfsNelted0EZNIlnt0D6
         5efQUMRXuYIJN1/yJQHjx0MJZepSTmc6wOgmK4aVjArbf6c9I0B59tgG7ZnQtbur7XGh
         8VqUQUCqpKjAmDfXuRUhvSrRRoBzE0Fkx1/ifJmb6IxC6Oz/eLN2LEZLaANtT2iMwXVM
         bYsopvw0UYb3t9wWapVCXSnoOqDtF0RUIvlabjWHCjJ+8OnGtaBcY364fzvp+tXzsHm3
         Kjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279379; x=1793884179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFgV7hQHnaqB3LpunHXmA40D5cDU+9hyfeWDV11nSSI=;
        b=Nz6KRC2clMRGhdcJo0bdQEfsKIt+gfBygjA7zWgatt7oHd8D31Ql6R4AE6UzFsMF/y
         Ye/wQigdj73vddQcDVBYdic52AHXUVte80qhdWJJncYHaZWvZea/Fo12FxOLhC24hRbW
         hYsxkPV+PDcGlEUCC+baaxaiH9dopDZ2wjbxMhfHp3837zfEiixZcF/2Mbw97eHo+Jvt
         EU+7LVeaITgycNxOLj1/PHH45D5Sh0Zc4ngKutSZC3L+MjZRZiyfSDnJIelXISqa275v
         0kRCvOsqdumDOU19RLWzgXTzlSXB0Lh0YxjGg2WubobGORAyrvy/HK9NaP0Jf8TJ0nvw
         2Iqg==
X-Forwarded-Encrypted: i=1; AKwUvBy22I8997/A05yIbxfElClhyxCzShq8oVTSg2bApYC9Bh50A43ST71qKQSI9/nNf6amhr2CKaXuKPHq6Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEivhWc6bvUZGDh5OA1maCGcez2i0JdwoG4eiZK12ouue2kFfg
	mRBbTFOzBsLNUEDg1Zdo8rlQq6YnYazb4SnPOeOVGLvIDE7dI1H15lK6bnrNEEVO6PfyL07kRdT
	6/TTf0suQdVjQAAeLE45845k3dqBq5RdBBfFPYrLBGoeFckJ92MjevG3974c6T/ndHdgqW/o=
X-Gm-Gg: AYBFou1ynDHAiiNwZ4oZ4qFVWp1qRzNT74kPJNtNNGH4Red8zL7fLXYSs+ZrUB7YfDV
	XtOxWhKhXyLPMxcLpLBx258tdM6WE1StrBvKsRmko75Bjb6/wVhga7KWwAn78F33Bzg6Zpum6Vg
	SAwh9iFvqMFM1MIPoxAKp6hiKW2Jc6woixdxRfD/uQPVqxH5GNSOaYkM8Dk2qgafr7TzEvXngN5
	qkmSTK7Aicno4UUqjF5S3jk+HWb9cWOOsY9n0Akv0/O0KMVYIXkVCjSzuE1un6KGJxyHhfAI0CB
	PtxUxGJ5YAcCG8CfPGBxpIGXSVZf7p+07fiJI5EjA4c7I9slWn8LTvTzS6JPYpdFcHV4yTQunVK
	zkp7M4/cmRO+j3E+jFfYXF1hMu4JifgVFur29DSUwsd1lc21zBG8tK6xTx+UGynC8079SRSJXWX
	sbXT/T6Ebqt2ZpyCGB/y3cJ+cxkexeYSEB9NPYPFROrtPZUOPNIIKpslqYQqEx5OZ+2elr8K/GQ
	w==
X-Received: by 2002:a17:90b:35cb:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae5817ad6emr4046520a91.42.1793279378479;
        Thu, 29 Oct 2026 06:09:38 -0700 (PDT)
X-Received: by 2002:a17:90b:35cb:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae5817ad6emr4046490a91.42.1793279378010;
        Thu, 29 Oct 2026 06:09:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 1/4] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
Date: Thu, 29 Oct 2026 18:39:10 +0530
Message-ID: <20261029130917.3714691-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX8Me+cmkW3AO+
 7RgGbdMEbwJ6yNA00KA0erCjoIQHS/hjucu/vvUr1rSAe4gKfoRFU9YjY9NZYM2ou2U7ar9vCAO
 T98pl7XBKuYREZIrThX54GxjfmWOOgWOUi7fSQEHom7ayWLB7yspkAnUTIWmcDhj3U8iiZYfKYp
 7KEHAKru0szsD3p+5N1K93cjjxlpLboL/eeccPkYWMGxXBd74pM40PH20dCT26oSTzAEKicnDdp
 TfIqEnxnQokslLCDbzymOeKckNblh4b4ZDJLFlOZsemCBAuXO+3dFKBeClU5y6vKg4C4HjsFWR8
 EylU5SWIPtTCnL9l5e2bDqlsHVbrPesPyrtEvXzfcRDMxN5HHQ7+0UL0TqnPmSsnC1SxABG3Ob/
 T+6qO3XQWhOUFkK1pBYggxKZWxiQatMFJgRXZJMTFEA6UyCmHv7LwPZ+uL5h1Byps+NSIknNXkH
 jxBxlJEDJVuL7C5iFOg==
X-Proofpoint-ORIG-GUID: nWYUbHnA6ALHBXaWXfmdhuOOr3OPGuxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX1VijWbCxdhHg
 WSKWhiEs5n4KkCENNuLwACTW+TU0uMShS8IxLRmPM6bsp3WQEQKFL9ZOao9YCrjnE7gL3J0Jzxj
 PYSdW+LGAOelyecHt11t7RloInz0Wcg=
X-Proofpoint-GUID: nWYUbHnA6ALHBXaWXfmdhuOOr3OPGuxZ
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae34593 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2yNJKbwY4VjyOEKDNOIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_060940_778971_EF77630B 
X-CRM114-Status: GOOD (  10.54  )
X-Spam-Score: -2.8 (--)
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

Document the RISC-V Performance Event Sampling extensions Sspesa
(Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
Overflow Interrupt) in the ISA extensions binding.

Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
is present.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..5c1c0d308615 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -269,6 +269,18 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspesa
+          description: |
+            The standard Sspesa supervisor-level extension for precise event
+            sample attribution, as defined in the RISC-V Performance Event
+            Sampling specification.
+
+        - const: ssplcofi
+          description: |
+            The standard Ssplcofi supervisor-level extension for precise local
+            counter overflow interrupts, as defined in the RISC-V Performance
+            Event Sampling specification. Ssplcofi depends on Sspesa.
+
         - const: ssqosid
           description: |
             The standard Ssqosid extension for Quality of Service ID is
@@ -977,6 +989,20 @@ properties:
                 const: smnpm
             - contains:
                 const: ssnpm
+      # Sspesa depends on Sscofpmf
+      - if:
+          contains:
+            const: sspesa
+        then:
+          contains:
+            const: sscofpmf
+      # Ssplcofi depends on Sspesa
+      - if:
+          contains:
+            const: ssplcofi
+        then:
+          contains:
+            const: sspesa
       # Za64rs and Ziccrse depend on Zalrsc or A
       - if:
           contains:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

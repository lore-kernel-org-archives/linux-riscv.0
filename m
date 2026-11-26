Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75F606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 21:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWBvlg2L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+awMMLl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFn49Os4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IM+AnkpfeVJ0IfmJFsRkV9ynFA6NzoQYtZwX6dpPMmw=; b=QWBvlg2LCgun29t3SXit3MbMsO
	1BbESsIU0jPQeFXqU314LiaRjAP03dUu7J4WvAAU6kd5fNmtHs3fCK/nxqEfuJ5z9gfg6HtMBWI9+
	G1N9vlnHzBRxYadWk8WkAUvORhSgB55PW9Pc+5jFzXvMLs7ungiFWVYzexxRSBE7tPUAldEp76W64
	mngETl3UIbbRM7ztc3+XW9Gk/JUuIjGzgAMQEBWhHk5l8hcCqjuAZay4gnM681g4k7LAsSFMyDhH6
	ZUJ3saK70uUO8mhy+c2I1+QGCbCo8Pa+yaJfEnlupmNhUH/Jxipmrn3zdoCF04bek2GydGRm1eywk
	GTL1Dc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5r-0000000EYvE-1K1G;
	Thu, 26 Nov 2026 21:33:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5n-0000000EYtI-1c39
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 21:33:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwmRO3865524
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=; b=F+awMMLlOojHpyBU
	DqwGNxhurppJie9EXst1C9Rwe+Ej8IU1yayGd+DwKDvnzirtMhn258sUw9GnI75E
	XiHS8GWSD1jeh1HgKobMM5B3LPr/t6lFchFaDxuHUWsgVOqWVTQAPFfL3pgNLWO/
	aHor43V5qaEdmd0hXhRjHKWTA63DpctRgVvajhcitJ6vU510rFRujl9ZtKsMBNFN
	1EH7erzLMascdyEgQB2Fs8SmzRRrOc8b+K2nhazr4IE0bDAQB8rcrkLx2cTIw/Wu
	Gv5vkU15sChBCnfn/8w8a9BjpVQAMbXDzJWpvvPbOcSdECFmMQ0Vtml/fb3K7Dln
	vL2fiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55r6tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0291cc0f2so90743055ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728801; x=1796333601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=;
        b=UFn49Os4twXGmaJLDRIABVvqohV8XBML8aFpISuJk/tFMf8SaxB7IgIRojVPJLTIfj
         O7LFrKdxq5YQLKZG4hXpeeSAmJV6o49wndvkrCQWd+8PEzuggiMSJMZE/5JTQnRw5ndW
         /NN8E12g8p0IXfTT6vbY/5PYAFYa8FljP4TM30NuvHHtEfUWk6Gw5bpW4S9G1AL+KM+O
         cQqj1llDYGWBl0e1aA1mBpZHIJ3PGqNDI2CU1trnAsZ8sSYrwLFqZxe7DoNWOz5wHmIN
         uJ+1agliWGyMzUrIVO1yFAc4X+QtGb2BGurZzxV1MBCNUrRysYPzs5vMX0XIrEWiwCJR
         7WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728801; x=1796333601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfBNjNcbAknMVLcIxyiwmVlxTzbfnO7Xk020NA7XSaE=;
        b=SS2xyr7FZQG5dMkBqf+2tObDuh7xvRUTAQ5eNUtzqoM1NrIZMlrw+yEC5uTMwZfoxw
         zhLOuexSQ1db52SvgW9hp/DcyBZ4oPRMwEcGG/cvQjRqBJEXibvdOEhNvpYGlWhEivKQ
         rG+u0jl6s/fSWqrnkr3drczwwMCG8g744nPwXo1eupedPfY0K0/GIDixfGvbCldkfkZ3
         y7uh7ydDIvrK8RQFm1Gbrl89155DrWh61r6bxKsxinIByhP/ish+7e5HaOaOfqVHnyVl
         PzdYmyx63hiyEkDasXqzMZka8Bw0HQM8sC2oCb8ft5YurySY1TT18XYczWbyJ37Rabsd
         4M6w==
X-Forwarded-Encrypted: i=1; AL+hErHZSpUcrnfdsnT1yvGw0+WAoyufDh+lbX9schlsM/iKhaPbtWP7ysmA7lS/PAagVPRLh6yO/25XoBr2Aw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+JKQGlHJAyPAd3+3uLx8fP49FgOyfi45AUHTINZo6HIJ/G9HSi
	RwwO3P7SMnjTGGEp27ysocnoecS9td+ue2xUIflK10fYCXdspC2aQwm/fx6Kpewi0OyvwCaLehh
	0aXWCFwZN5PH7ng8sYeC7N2FichrZK/W4Gf/P2F3yG5SEjQYi90OWKAnQD3oy0T0yI3mjvV4=
X-Gm-Gg: AZFdTZcO+3cKbAsed1LQUnYof5f8bJz18JwNGNeFbwH2FFrQDD/HNCntsJ2Vqmcf9Ge
	MlBAeMZ+TPRmw2MN8CzIG52coPVC9JTD2dOquwstFXRiFEtKHQtON60LIcAKD9Hw80z957A6wU3
	oCbs/HesTWl0vkqn0tp7sTeHaBN38afu0E1rh5pg/S1TqPUMB/2XGiGvOlnwVfcGTQBigcDP2/x
	hXbO7wsjQHxon3I+Ch4IxqpMUDSdI4rDGZUOSXHg35/+neL6mquMDcyVQz03jgycxNMijx2RtmW
	nvY2Qnwp50/M+CU+nS1g9LtWffVg9g8hWXyLfGd4A9/RjhhMVajiTzFL7YJmHraA8JWas1ssWJs
	ZSV1IUdf9C7prLPy0gKHTv/vJ4cf+/z79ydW8S7C/B4clQtZY56eMbod5AaP9tETCKKNaTd54Yj
	z+iXvQPHqfHg==
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr246268825ad.2.1795728801156;
        Thu, 26 Nov 2026 13:33:21 -0800 (PST)
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr246268485ad.2.1795728800553;
        Thu, 26 Nov 2026 13:33:20 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm111306815ad.1.2026.11.26.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:20 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:32 -0500
Subject: [PATCH v10 4/4] riscv: hwprobe: Document that keys describe the
 user-mode environment
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-4-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=FWThD962kiFvT6EJsGU+cOr4UlRTXPFc45KyAkIoAXY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpdUx6z07rrsY7P0WomvEe5e9Q+rWxd8hrwtDfKfd1
 LMzOXqho5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZyI5iR4W7FS4VzJmKCy8+Z
 hDjMc/0fLa0u87Y73FImLelH6I5uRUaGNWrHfl3IzXjgvk/4jhJT5YWZJx9oztgcZCgY+uIi158
 NTAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfXzo5fqeaJ2jDI
 gT6Y6e9BeODEHVT9vrcAbkUy4zXiWJqze6CYwtsP7PStq5XfiWuCwDmddwKTK44if/LjH6z8RB/
 blqNpaof2vl815KN0wdz109lPS/DhAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfXx3LgkNInQGQy
 Ciz/o4blor3hjR4QmbNm/SaMLZGfTIfqppyDt/4OYetIA9MrJHChkyuprS0mg95Minkg83hLt5K
 xyvHGknbGsyM+Ly6re7v+pzzLld0Wqa70W16Yooy6jOeU78h0kNRconVte8UnYqiCVDGWApri32
 DK5fHjaUbLIiM7O+pI4JyiigJM8MRY5dYLMTxtFZKyBKYe/hMu9Kct6d00Ai2PUjTqXWXwKYqsa
 +vOJqIEpI8NYAyeGlhWU/GvzNVmlHXUBawe+QIcCsADeGGt3vkbRMjGEhheWMigZ6bd23NbKy9W
 ZCW5H8QS8Vc4xYL1VRILg9/AZ61rF3zZFvGznlkQbOE1vwVjyJF90AF0fOqlyRZ8NObSJTuEUlp
 vURZI5fHvnQGlxNwdnVlUyQ7HBshMlfS/Y4mZlcnqoWi4jCjw4fLPf8GCwrBc2A/xKDCwdPrFR0
 f81iP02D2IHLg8615Xw==
X-Proofpoint-ORIG-GUID: vuzAEri97EuT_9btLyX_R-P4yLFxds4D
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08a5a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B598K4GbKnGUPSV2RHYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vuzAEri97EuT_9btLyX_R-P4yLFxds4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_133323_585798_84C66D85 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: Florian Weimer <fweimer@redhat.com>, linux-doc@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>, Guodong Xu <guodong.xu@oss.qualcomm.com>, Mark Harris <mark.hsj@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Andrew Jones <andrew.jones@linux.dev>, linux-kselftest@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Peter Bergner <bergner@oss.tenstorrent.com>, Aurelien Jarno <aurelien@aurel32.net>, Zihong Yao <zihong.plct@isrc.iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every extension key in hwprobe.rst says the extension "is supported",
which leaves open whether hwprobe answers "does the hardware implement
it" or "can user mode use it".  The two differ for extensions that need
a higher-privilege enable, such as F, D, V, Zicbom, Zicboz and Supm.

sys_hwprobe.c already gives the second answer for IMA_FD and IMA_V, and
the "do not report disabled extensions" fixes [1] bring the remaining
keys to the same reading.  The base behavior keys inherit it, as
discussed with Radim on v8 [2]: a base behavior is only usable when
every extension in its set is.

State the rule once, in a note before the key list, instead of
rewording every per-key "is supported".

Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [1]
Link: https://lore.kernel.org/linux-riscv/DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com/ [2]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10: No change.
v9: New patch.

Note: this patch states the rule for all hwprobe keys, but some keys
only follow it with Radim's series [1]. I am fine with this patch being
applied after [1].
---
 Documentation/arch/riscv/hwprobe.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c24630c672c43..30dbbbc274775 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -45,6 +45,27 @@ On success 0 is returned, on failure a negative error code is returned.
 
 The following keys are defined:
 
+.. note::
+   The base behavior and extension keys,
+   :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`,
+   :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1` and the
+   ``RISCV_HWPROBE_KEY_VENDOR_EXT_*`` keys, describe the execution
+   environment the kernel provides to user mode, not the hardware as
+   such.  An extension bit is set only when user-mode code can use the
+   extension on the selected CPUs: it is implemented, and the kernel
+   either has set any higher-privilege enable it controls (for example
+   in ``sstatus`` or ``senvcfg``) or leaves that choice to the user, as
+   with Zicfilp and Zicfiss.  An extension the hardware implements but
+   the kernel does not make available to user mode, whether because of
+   the kernel configuration, a boot parameter, or because not every
+   hart implements it, is not reported.  Conversely, an extension user
+   mode has turned off for itself is still reported: the keys describe
+   what is available to user mode, not the current state of the calling
+   task.  A base behavior bit is set only when every mandatory
+   extension of that base is usable in this sense.  "Supported" in the
+   descriptions of these keys is to be read accordingly.
+
 * :c:macro:`RISCV_HWPROBE_KEY_MVENDORID`: Contains the value of ``mvendorid``,
   as defined by the RISC-V privileged architecture specification.
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

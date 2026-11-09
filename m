Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505AF606D817
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1OiSnnIz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rz1cNzNq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B64Q7s+5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pN/NRrxvUnH2ZON384x1YHopYk7UmUoZVVVghnqcXrY=; b=1OiSnnIznefymYSn78l35XgTaG
	TNp7TK8PcHPSqPaMjQrzH9JMwRcDnZak9vqBiOZzx9Flzn+rZd3jrozOFOooB+TMwxdSNScUpliwH
	Nfuz1hxXDsRvYdT0ejv2bZ51ydcb/6urds1rh9c34mNU/veG60YX5s9glAqvCMOF6rxOc39ygMvg1
	JQbAgFy70oFZ/YpnbULQ3d5jdZH2nEffYmevUItNeq0/RbkePCPNqHFiHzTK182C1LDIEcTUhsPQQ
	kBeg/L8LJ6x6TxsI0BVe58EXVqtsFV3jDVHTNp/7dWDjH993lGnw8QUYhTxebNNd3iQENMFDJvJm9
	wALzaCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOnL-00000000jgp-3IsC;
	Mon, 09 Nov 2026 12:48:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOnI-00000000jda-0eXk
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:48:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Bb45X127413
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 12:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=; b=Rz1cNzNq172Tkyx5
	gITH2LVZb1HIq8a89fhb7tq14z3Nn5M/IYXPCpuCCQAMulaDcXbKlTyVvp//Vl2U
	JJoR+aL7RfEIZZ+NkewMCWT7AgaCm/5qEFndmkyn/5nqMMrZqnyjRcjW10IfXo0y
	AtyJnHJnm1BcH9RKhZwLQpnI92amlxy+ArwfviWTtS5UfC65xQjF1rJSEXyk4rR3
	XsKxQM+6Okzdzuu+Eckc5ezElKnF+hYuPLPjg4JUPElSREEvk9p+GJ6icJt40Spu
	hra/rRJtR+mIAoHxfmf+7MqaOro6VgIPzZFXEfXgqzuOZyL+t1rD6jARU2N6lsLS
	FiFFbA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf587nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 12:48:14 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b34c1f226cso11905477b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 04:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228494; x=1794833294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=B64Q7s+5wHAYTL8ucWGHsQVQqnBTkG1zC87IXvDI1ULNsWXiyk2o7/6ExgK/4+WjJQ
         02glknLHY0xz7kiBecp0SvKCmy3odiG3sKLllRrrZuaX/fzzUETR8FS22Vf7738WqiMo
         L2EwT7RNB69rSJxLfrgpsqpsV2HN/eobECs1sM3iP1gst6L02NVMxgpLDpuIMmQ1m0mw
         UNp0lIjiSNt7JzXy8dJLgOPakHBLciweV2x2PHTFThxKIQCgjkj1NNXDsJgrhaeDx3wG
         eowRa2NShZAN7cesHFtxvXuK+dhZP3Xi5tjB3AthQBZYIYC3uNXcBSRgeEn66MU8dVZv
         kmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228494; x=1794833294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhw+h7db134U7zOZoAt7AVpSWJ8Yd6WvGbQWPWpIUpU=;
        b=Y+TysnjUohBavFv1gTWFAhgiWVN57LdkaA6UbCHlt1lCnyXTuGqZyDYLCa8n/yTgbY
         L0lgEzQLE1iDrkdCkw8BYDP5FPf5JYdbDH+4Q4H3ROc0Wcc9/M6xf4RXvKnjqKL8Wvnc
         Ie6Y3KaAq60agyCNFrliLlKLKshbdOTaFGj6r2f1cPlkuzlFHyqEw8gY7F67xgRg7RXv
         h2nC2d2/Y54dzkBB1wabYjmVnxbn39NMDUJ4FDeSBmHc+jsd3sqdbobiTCWhBLeR8yz1
         ztRk8y94q3P2IM6dSDxaixnoVvc1Gbe/b+mCg7gX8vb6jh/lqtWsOvmzDxHhMgWl/O/4
         SPUQ==
X-Forwarded-Encrypted: i=1; AL+hErHf2WMOrOBOQhepEImo7nF6uluzbILukzCj6KQCWiee0yp7zGz7aXYRsAI5wzkiIXp89lCE7zVWDMzRqA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+IBypcrjF/kQwGPaeTmtbpO9ivv33CJUoOGL/VTSUxODDM0NpX
	wgnsyO6G027/A6BSogVWq/yJMZgFsNCD+PkCymbYlqJCydOA1FDPeqKyg6es4/is/aPCnwmBXMk
	erDxtpHOBD9wEYA2wu1Czrx8IuzeGY+nMt3sFlvDPHnekEREiDqqcuGFtjeIfW9vmOjNdCXkhME
	gc0bmgLQ==
X-Gm-Gg: AYBFou3ppxKSnwSs82iWz3w0XtVwHCg4a1JaqMQeGP38cXlFYvcTjgIJytu1xN0qXgP
	fe8neXnilQ/Hyu+JTMBDw/M3v/7+cgmra6Iagdjg+r3Q7HAytRF53jskcuPVowL5hkMFJBz2F8s
	4F8PdY1xSZkYGMQCS4NujZcnPItKuMwnJV7Ak6e+H+UflYYxYJ3KEIs3aPJqemyOqpivCcIlDG/
	Lt+plUgd/05FHMn8ZL0sK+uHKJweoK+6dY0SWMAopVGDoMLcpmdLNFHe+x8srEIz/99CgVfQH0s
	VikZ86wkj+5jtTHbYbBUxRrKIppDsNlW1xIZAVJy1XkcbhWmMivSiiBb6kS5+eJdNNk0hDWDMmW
	Cp8FeqPMVgL2sYzF/4NTWrs3KGL8yLXOxx/j58YNcP8KUgfoXONtbJIkQ8re8aes5jchjxBrof7
	OFBHK3Y19zDA==
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253767b3.17.1794228494368;
        Mon, 09 Nov 2026 04:48:14 -0800 (PST)
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr42253337b3.17.1794228493700;
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63209asm34191627b3.6.2026.11.09.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:13 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:37 -0500
Subject: [PATCH v9 4/4] riscv: hwprobe: Document that keys describe the
 user-mode environment
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-4-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=E7QUgZlB4TXvJCfVy01ud6KHHfflRvYJVHUOIS1HhZw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB95MCqjkXT7f1F5As0JPn+nSzu0TmMq7j8RtO+uZ4
 CcrNl2so5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACbi+52R4Vfh+qMzOLlZZlT4
 BW973ZOjesY7RvPg8S92e1a85Xkm9pmRYdXek9p1TFoP3qx6wiRsW3Bu5ovZauunM1WICZpue54
 ZwQgA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: 9ubcC9rD_nNM89f4DzZH6FXM9pmxjoWu
X-Proofpoint-GUID: 9ubcC9rD_nNM89f4DzZH6FXM9pmxjoWu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX4Fj/zoGs1+b6
 tlrFNd6qpos57Da2v/eintfMeu4PvQWtbfEIgFaoaHk6kYwCMEIb7EweqkGJcccdmU9vA7VS1Bo
 l0H4JRXd4gPSYb9sz9OYiyPSBnzjhV8=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1c10f cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B598K4GbKnGUPSV2RHYA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9aC0DAZJMRo2
 NkAz1UFgq7b09D5FgteTY1SkPGoAw9CAezKLsU9bU+NFATS/iUR/Tg5G7Qavta6ry+sQRKIIUcn
 uCxDos6o/n6Hhm1S4SAfJEAKQNcUvw898YCww5hM4OceepiZGh8fkmsxVYLnmnabjPHF54OINuk
 ENhIAHX5Zm3R2U2tgZJYWJwSF6hhv3tO/+uOD61D5bubV8E64BnoMawKIebGjv3y5mIreDq8/tV
 ULdN0+bYrQ/n2lwwHFVZdyh3GSL8nT2ZQ5FN5syPba1867HYLb5RXrJl2Jm91mD3GLlQlPc5JEn
 ACevt4hTaXtO7Cyge21nGLnmiKP2aunThgF4bFfRxNokBGYOMzHn5eOHql82h/40oLK/TRhsvqx
 NSFdhNu4z0XupLsS9DDh/44VBz2af4Sc/kmeYUy2ptpPqKRx+e3vmzBcSQ31/0zEJ7p2cqc2EtP
 mkVFq/Dn6wV3m8EtL1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_044816_343799_275E9DB5 
X-CRM114-Status: GOOD (  19.00  )
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
v9: New patch.

Note: this patch states the rule for all hwprobe keys, but some keys
only follow it with Radim's series [1]. I am fine with this patch being
applied after [1].
---
 Documentation/arch/riscv/hwprobe.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c24630c672c4..30dbbbc27477 100644
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

Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9EDC63777
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 07:17:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0312F2223D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 07:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eMbUdBJd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiXtx3DP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0312F2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q+LM1TKVqD9tK8S5R++4BoyMuWcrZNkIeoAY1WmZtro=; b=eMbUdBJdLKpZvRTcBZafOVEbJU
	sVKYOdAXax/AnKtK9gCoqObKPmfmrQU/x3v0jKAEic6HCPhvTjgLqo55Ccgdr3mfsqTfJRV3oRt2x
	H5VSCqMn6MHcl+oUVo2Vnx6b5yV5G0jGmx9K2sMiuKvH5/cWcQm3sFejcNmGkCJ98dbQxGOI3yAit
	jyi5u6xgtVvSpXbADvXTA0wJ2YerqJZnx2zkLMFBphIlD8JfMv0lWIpWENUsPW/drW/scopsf4+el
	IpvN+kVsUtDRHpqSiByWiS+8pCQLjy69KJLjOr3os5nNcXazMejAC9kVFSWNECu3SFBBElCXvnIJs
	+RDCdU9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHi4-0005PY-Lj; Wed, 18 Nov 2020 07:16:56 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHi2-0005P4-I7
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 07:16:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id h12so574728pjv.2
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 23:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3seY/lcs8TEEmISiXOkYLuxnoviwJk63EPoYZmFSHk=;
 b=RiXtx3DPHlRFlDgTOXZ8m4RbvrX4ymel4W9RkaXoFDy5tBZ9haArB5r/JN37Htyn4G
 t46IT85L51o98zqItmbV0u5B9c18/6TzF/HNHa3XD3ROGLGf9QikkIgkZtDK/PBSILnJ
 Onb7rpNF9qFt9NW/eOTdYmUZj7KgRksG98Zhf3yuG4PL1puWCFHrHld7OR1giSS6luEJ
 4uW6r7Hfb3+9SxTinlkxryMx7NlLviZPg2V2vt58Hvbhqwn7F/3A6rywtTqdXOVLqiS9
 17KJX6vwbxa18SiXyOjIM4/dM3adwo3EdtT1cUWeQSgtaeIAJeSh8CjHC3VK+KOW33rc
 3jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3seY/lcs8TEEmISiXOkYLuxnoviwJk63EPoYZmFSHk=;
 b=VmH89nEafzyjHoVpisdUh5cULhoWG3IR110dyp7JLE0lQwYe3vAzKYIUuxHY25eCqj
 5dc9o9oXFgMCUM7lTuT4m20XSgEi2GsPkkU3u4SiXFxy5iqMfSvmM5qio1tot1NId8db
 b9Gq1l/V/pE3ZHnYTQg270St67T/Iw+eix9jodt+WHfnrq69/Aey6/ZdFeLay4CYU2zX
 OvmtJW605fkPmRRgn4Gxr3PNf2nG9odqcRzpfh2vI7eIIN0lIg/B3H+qmlU1y+2SEIzt
 4TyLsHXR/QTlDH2kb7tnw6zUuRI6IMoEz6N0Qp6zd1KuvYS6thE/VpTdXpHb1JCKKEo5
 gcaw==
X-Gm-Message-State: AOAM5315c4onIPRg5+g/YcnAOl11aAKynDag6gppsfP1GjLdPtYPcGOL
 fWTEgedtziobR7lfgjMkaxY=
X-Google-Smtp-Source: ABdhPJzkewEWXj9x0t+Tj1EprABPBAe23jRnGAw5xRlVzku4s8j820vquFyHFWQh/VAannLu+8JKSw==
X-Received: by 2002:a17:90a:b303:: with SMTP id
 d3mr2813534pjr.207.1605683812051; 
 Tue, 17 Nov 2020 23:16:52 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.45])
 by smtp.gmail.com with ESMTPSA id e128sm23019382pfe.154.2020.11.17.23.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 23:16:50 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next v2 0/3] RISC-V selftest/bpf fixes
Date: Wed, 18 Nov 2020 08:16:37 +0100
Message-Id: <20201118071640.83773-1-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_021654_612160_57EBC944 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, andrii.nakryiko@gmail.com, xi.wang@gmail.com,
 luke.r.nels@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXJpZXMgY29udGFpbiBzb21lIGZpeGVzIGZvciBzZWxmdGVzdHMvYnBmIHdoZW4gYnVp
bGRpbmcvcnVubmluZwpvbiBhIFJJU0MtViBob3N0LiBEZXRhaWxzIGNhbiBiZSBmb3VuZCBpbiBl
YWNoIGluZGl2aWR1YWwgY29tbWl0LgoKCkNoZWVycywKQmrDtnJuCgp2MjoKICBNYWtlZmlsZSBj
b3NtZXRpY3MuIChBbmRyaWkpCiAgU2ltcGxpZmllZCB1bnByaXYgY2hlY2sgYW5kIGFkZGVkIGNv
bW1lbnQuIChBbmRyaWkpCgpCasO2cm4gVMO2cGVsICgzKToKICBzZWxmdGVzdHMvYnBmOiBGaXgg
YnJva2VuIHJpc2N2IGJ1aWxkCiAgc2VsZnRlc3RzL2JwZjogQXZvaWQgcnVubmluZyB1bnByaXZp
bGVnZWQgdGVzdHMgd2l0aCBhbGlnbm1lbnQKICAgIHJlcXVpcmVtZW50cwogIHNlbGZ0ZXN0cy9i
cGY6IE1hcmsgdGVzdHMgdGhhdCByZXF1aXJlIHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzCgogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlICAgICAgICAgIHwgIDMgKy0KIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3ZlcmlmaWVyLmMgICB8IDEzICsrKysrKwogLi4u
L3NlbGZ0ZXN0cy9icGYvdmVyaWZpZXIvY3R4X3NrX2xvb2t1cC5jICAgIHwgIDcgKysrCiAuLi4v
YnBmL3ZlcmlmaWVyL2RpcmVjdF92YWx1ZV9hY2Nlc3MuYyAgICAgICAgfCAgMyArKwogLi4uL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi92ZXJpZmllci9tYXBfcHRyLmMgIHwgIDEgKwogLi4uL3NlbGZ0
ZXN0cy9icGYvdmVyaWZpZXIvcmF3X3RwX3dyaXRhYmxlLmMgIHwgIDEgKwogLi4uL3NlbGZ0ZXN0
cy9icGYvdmVyaWZpZXIvcmVmX3RyYWNraW5nLmMgICAgIHwgIDQgKysKIC4uLi90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvdmVyaWZpZXIvcmVnYWxsb2MuYyB8ICA4ICsrKysKIC4uLi9zZWxmdGVzdHMv
YnBmL3ZlcmlmaWVyL3dpZGVfYWNjZXNzLmMgICAgICB8IDQ2ICsrKysrKysrKysrLS0tLS0tLS0K
IDkgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgoKYmFz
ZS1jb21taXQ6IGVhODdhZTg1YzliMzEzMDNhMmU5ZDRjNzY5ZDlmM2VlOGEzYTYwZDEKLS0gCjIu
MjcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

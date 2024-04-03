Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB0FCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57RHJf0w0icrc+uKY4rQjobAhb+BkbQB1cWYwLwPu64=; b=A9Y+Doc7GY16Jx
	QSFWVZz1gsNtBOC2VfG86qs0Ky9/5Zfr4zOM0HfG8R9uaMgjoxY33wLk3ivEHwMtOD0koFmDLbCYq
	76vf25Bq4hoGGIZHPwOufHXKPaaABXUHJCrNHcFqsywPaDx/gAHfF7b29YhgOzI/Vb4lzOWbjSVOY
	pR26MJPrkxUnquZA6hTXzsMPa1UpgkMxlCPMli1YBH6QlBH0zQhYgfckNZ7e9AI6om8oeaIuF/jme
	6GQ2i+iUvI0pMG3wl6re0kJSNIePymgPt5724s2qJN6J9vLfa+Qn8/heCKWGRMfo4Kj2DjkJxtjsY
	NYQKvGVq0GMPk6/tKGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9vj-00000000W39-1xai;
	Wed, 03 Apr 2024 23:22:07 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9vg-00000000W0d-0JkP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:22:05 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-432fe06d76fso2281151cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186520; x=1712791320; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXcO43bUmmb2iWVE73B+B6TYtQMD5KIeEgVcMTv5NoM=;
        b=v8HF0fy9hKv43dZNJtfgWpVg5aqrBIbLiNhEIv3r4PCx9uZROscFSZsnQYb5+gv1ah
         0gQh95IAJQ0MsQga5kVGxSOZWSWLVKBZxE6sOT2WuwT2+tvBG7jjqZ8vOqajR9u+qTcn
         eh/b8zg0yFujU6bAjNtb5auBx6fBT6odVGUYPyYRX+XZS+cT9/BpPM5otDh8Ie3mWz71
         YTpRwpd9+s9rac7LXkrhVwwq4kSssQkpLStOOJl5PM4YeWpiGdAePgBqpJUIxotXoy+t
         XsW+n7DTT8u3lOJOBpgKMcRAfRSZ1nuvUWVVo8c47IVYKzXiJk3MQnlNOh8d2hb9KIZ3
         6G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186520; x=1712791320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXcO43bUmmb2iWVE73B+B6TYtQMD5KIeEgVcMTv5NoM=;
        b=g87zqPnukuh9Dw2YOYa9ydpljT0E52ZJ17txdTF3dSrmRPKg33QNSd87glHy/dP1hJ
         NVk8hiEh8dMSaJW9Vj5/qsiDAkZzbvyYUD4ciEFrrcy/wgVdcE0djZUjm3oYc3O6auG3
         O72W+s6DCqQGuzuoYAJkB8OBnkPvvDmgDqpwnTlm8WC2VKpiGoIDjI+UnCWCBvumOj/F
         IXD44prgEi5nIc0wyvUWzNybiEmWXLLU3JLQd2tr54qzU6uWYqV6t8fKWhG9Bgosltz7
         pVKRKsDfrEsNz6YzqjOZdAcMW7uHyk4qKt64Qn7XizHDRh7jR5fF/fEtSRhQb/VdIZ7H
         uC+A==
X-Forwarded-Encrypted: i=1; AJvYcCW/LD+BEDa4o0nKJeRSnHPNVGw2dKFASs4lVZDw3jFQi933DUbiMHjBjtg37E6ujNfrs/m+16CM7yx53KSsmk2ORPGH0UolCbdnD2bqeqg/
X-Gm-Message-State: AOJu0YyPncmEHXWPhhAAgbTBFKNJoVyj2WLf1thIxH6kz/XGCBHybzSL
	BZjFHijql8+eq2b7vFhjmE4OV1TWITeprkOFguwcsCnSx9GvQgyXXzMfgJCkG5qom6baKVtsBBT
	S2nrTO1mrQoPHA0M+5wcqwa4HM277P8qSS2nIpw==
X-Google-Smtp-Source: AGHT+IHeuRiGxCrbAbOW/v+/2itK4ZpQ85NMYmGobH01UpzDgaJ8I2k2PGyFRf6dw0LUPjoEDgTHBQaY7AiiWo2l90U=
X-Received: by 2002:a05:622a:1653:b0:434:4e8d:4357 with SMTP id
 y19-20020a05622a165300b004344e8d4357mr407490qtj.21.1712186520623; Wed, 03 Apr
 2024 16:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-5-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-5-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:21:23 -0400
Message-ID: <CA+CK2bC0EmNCTScVt97xKBgWB9=BND6KFjJPGd8QXQ8hM66Y5w@mail.gmail.com>
Subject: Re: [PATCH v12 04/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_clear()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_162204_165944_C05A3850 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEz4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA5MzFjMzhlMTY0OTkg
KCJtbS9wYWdlX3RhYmxlX2NoZWNrOiByZW1vdmUgdW51c2VkCj4gcGFyYW1ldGVyIGluIFtfX11w
YWdlX3RhYmxlX2NoZWNrX3B1ZF9jbGVhciIpLgo+Cj4gUmVpbnN0YXRlIHByZXZpb3VzbHkgdW51
c2VkIHBhcmFtZXRlcnMgZm9yIHRoZSBwdXJwb3NlIG9mIHN1cHBvcnRpbmcKPiBwb3dlcnBjIHBs
YXRmb3JtcywgYXMgbWFueSBkbyBub3QgZW5jb2RlIHVzZXIva2VybmVsIG93bmVyc2hpcCBvZiB0
aGUKPiBwYWdlIGluIHRoZSBwdGUsIGJ1dCBpbnN0ZWFkIGluIHRoZSBhZGRyZXNzIG9mIHRoZSBh
Y2Nlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJt
LmNvbT4KClJldmlld2VkLWJ5OiBQYXNoYSBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVu
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42B4C761AF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AriwCIWQl5GVrfY0DI9ZbhPhDlsPTDguCQtlaORkSNs=; b=uwbiEUz26YLaQ3
	a+TSvkeDv0t10uO1VbgX1FSg7g2EzDlDp3pOrZhlAUaABJA7VsGqd6xoF4ECCGIgZGFpbZK+F6q+y
	foAPucX2F4PIHw3v7ZjXuqe3BVaWSlAhIey1UQs0futyGxbfKxvfizJhnicJdLDuvpRxwxIv9P7pz
	v5epvtMBeNF91/HXVHbUnEIMOrIAUwvwK/EONdd2Eh43uakXvfxNOO+EpX1tpk+Dij1CD3zbwsVWH
	74xtC9Prh/hp4q2WBw9rQoTTntZlmyWLRfqKOHTW/KfJb2w08rolZ1eLywj0sf99E3FQmvAsgpqvk
	40THVHGknjjIbPUvz7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQX-002H5T-1B;
	Thu, 23 Mar 2023 15:00:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQP-002Gzb-2k
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:00:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so2331796pjl.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Udr950R2Z02WuBhnFPF0mNQ6jR2x6UMx+TQ6xeOkBXQ=;
        b=bSsEQwQ4XPhZSMXAXUQujNFGLk7NDaeeq+gVyb1BYBY7ee/7iDet3nfe3ZiVq6/Pal
         BUNnz1HYK8poqIlaP3vonnN2jXi4EXQ66wCGbaMC6J5egiZSoj6XcmOpp/9IcjgcP2rW
         9oDkF6It6dUKhW9CrH0jQNRtI3NyCTMKqsBAIATLzKbL+WcEk31EuLEYhR+4SXtq1eJH
         ebDPFS9xdHF6rKcxWZixzrvR/BMnu5trvK6W59yahFT9w7xybXYctFlTEA6LfHVm2AMh
         zgsN2wImYreYNGRrhfvi5gy8KUU69gM7FMzJnWoXkfSAspgDqmc/yITTSNdPVCJu6gLF
         gEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Udr950R2Z02WuBhnFPF0mNQ6jR2x6UMx+TQ6xeOkBXQ=;
        b=uxaY9dAFZpyBDVTDzS8Q8NhDFc6gMoGFtkeqKyWL6PnfEQ54hceY2oJrgzdiXXjRpi
         67qw41QuYZSL6xd8ma6oj7yZPwIHqTP9BDglpYDMXHTJeEXAbZbrTcWo+v7qAaaPtwPc
         5IzigPqt0yd1dUR160KfT3YE1oNUIAP6M3vY+7BFLYVqRLTKumPVMh2R9SH18p4S3hTO
         SjksRZ0nhdftyEFaZqd3jeP7GMB2sHbT5GZdQLuu2oADO+imX9j/YMj3qRyDe4VbW3Jc
         VoQIzyth5ZaaiDc+HvXUTgzV+1aBUMbnUN9TDxCbqeMICCUVNm7ysHDJxRhkLnHmPPNI
         JZPQ==
X-Gm-Message-State: AO0yUKVSxcVZsMLojzIPNaeeXWgSPOmiGqml0279AO/482qgnVCNeAjM
	U/Nsk+7Lxhw00Tcd0k9Xy6HY+xAkhMplEovsd4dRaW4CULr7iE/cn4d60RPdVJcJe6iVGdOgzV/
	9WUVXmokshZj9zZuvYrAK5EprXmAHoevQMwAL2KW/azgRvzEUVjKRT1gV1SgNmCxNlcKm028MDS
	mF9M2ckemiFd7B
X-Google-Smtp-Source: AK7set9bj7jAM9hvZwKVYTRegG6kcX9LkdIIlXSH0wRRcsFhsLrRf7DJroNzGw6IIjucOKkptGl3bg==
X-Received: by 2002:a17:902:e543:b0:1a0:7422:939a with SMTP id n3-20020a170902e54300b001a07422939amr8628242plf.4.1679583620849;
        Thu, 23 Mar 2023 08:00:20 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:00:20 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -next v16 08/20] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Thu, 23 Mar 2023 14:59:12 +0000
Message-Id: <20230323145924.4194-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080021_894230_21D745DE 
X-CRM114-Status: GOOD (  12.09  )
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

RnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KCkFkZCB2ZWN0b3Ig
c3RhdGUgY29udGV4dCBzdHJ1Y3QgdG8gYmUgYWRkZWQgbGF0ZXIgaW4gdGhyZWFkX3N0cnVjdC4g
QW5kCnByZXBhcmUgbG93LWxldmVsIGhlbHBlciBmdW5jdGlvbnMgdG8gc2F2ZS9yZXN0b3JlIHZl
Y3RvciBjb250ZXh0cy4KClRoaXMgaW5jbHVkZSBWZWN0b3IgUmVnZmlsZSBhbmQgQ1NScyBob2xk
aW5nIGR5bmFtaWMgY29uZmlndXJhdGlvbiBzdGF0ZQoodnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3Ip
LiBUaGUgVmVjIFJlZ2lzdGVyIHdpZHRoIGNvdWxkIGJlIGltcGxlbWVudGF0aW9uCmRlZmluZWQs
IGJ1dCBzYW1lIGZvciBhbGwgcHJvY2Vzc2VzLCBzbyB0aGF0IGlzIHNhdmVkIHNlcGFyYXRlbHku
CgpUaGlzIGlzIG5vdCB5ZXQgd2lyZWQgaW50byBmaW5hbCB0aHJlYWRfc3RydWN0IC0gd2lsbCBi
ZSBkb25lIHdoZW4KX19zd2l0Y2hfdG8gYWN0dWFsbHkgc3RhcnRzIGRvaW5nIHRoaXMgaW4gbGF0
ZXIgcGF0Y2hlcy4KCkdpdmVuIHRoZSB2YXJpYWJsZSAoYW5kIHBvdGVudGlhbGx5IGxhcmdlKSBz
aXplIG9mIHJlZ2ZpbGUsIHRoZXkgYXJlCnNhdmVkIGluIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBt
ZW1vcnksIHBvaW50ZWQgdG8gYnkgZGF0YXAgcG9pbnRlciBpbgpfX3Jpc2N2X3ZfZXh0X3N0YXRl
LgoKQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
PgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggICAgICB8IDk3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9w
dHJhY2UuaCB8IDE3ICsrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmVjdG9yLmgKaW5kZXggZTQzM2JhM2NkNGRhLi5jYjYwNjM3NDQzYmUgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZWN0b3IuaApAQCAtMTAsOCArMTAsMTAgQEAKIAogI2lmZGVmIENPTkZJ
R19SSVNDVl9JU0FfVgogCisjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CiAjaW5jbHVkZSA8
YXNtL2h3Y2FwLmg+CiAjaW5jbHVkZSA8YXNtL2Nzci5oPgorI2luY2x1ZGUgPGFzbS9hc20uaD4K
IAogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgcmlzY3Zfdl92c2l6ZTsKIHZvaWQgcmlzY3Zfdl9zZXR1
cF92c2l6ZSh2b2lkKTsKQEAgLTIxLDYgKzIzLDI2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
Ym9vbCBoYXNfdmVjdG9yKHZvaWQpCiAJcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5
KFJJU0NWX0lTQV9FWFRfdik7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0
YXRlX2NsZWFuKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCXJlZ3MtPnN0YXR1cyA9IChyZWdz
LT5zdGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNfQ0xFQU47Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9p
ZCByaXNjdl92X3ZzdGF0ZV9vZmYoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJcmVncy0+c3Rh
dHVzID0gKHJlZ3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9WU19PRkY7Cit9CisKK3N0YXRpYyBp
bmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9vbihzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwly
ZWdzLT5zdGF0dXMgPSAocmVncy0+c3RhdHVzICYgflNSX1ZTKSB8IFNSX1ZTX0lOSVRJQUw7Cit9
CisKK3N0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0ZV9xdWVyeShzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKK3sKKwlyZXR1cm4gKHJlZ3MtPnN0YXR1cyAmIFNSX1ZTKSAhPSAwOworfQorCiBz
dGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgcmlzY3Zfdl9lbmFibGUodm9pZCkKIHsKIAljc3Jf
c2V0KENTUl9TU1RBVFVTLCBTUl9WUyk7CkBAIC0zMSwxMSArNTMsODYgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSB2b2lkIHJpc2N2X3ZfZGlzYWJsZSh2b2lkKQogCWNzcl9jbGVhcihDU1JfU1NU
QVRVUywgU1JfVlMpOwogfQogCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX192c3RhdGVf
Y3NyX3NhdmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKmRlc3QpCit7CisJYXNtIHZvbGF0
aWxlICgKKwkJImNzcnIJJTAsICIgX19zdHJpbmdpZnkoQ1NSX1ZTVEFSVCkgIlxuXHQiCisJCSJj
c3JyCSUxLCAiIF9fc3RyaW5naWZ5KENTUl9WVFlQRSkgIlxuXHQiCisJCSJjc3JyCSUyLCAiIF9f
c3RyaW5naWZ5KENTUl9WTCkgIlxuXHQiCisJCSJjc3JyCSUzLCAiIF9fc3RyaW5naWZ5KENTUl9W
Q1NSKSAiXG5cdCIKKwkJOiAiPXIiIChkZXN0LT52c3RhcnQpLCAiPXIiIChkZXN0LT52dHlwZSks
ICI9ciIgKGRlc3QtPnZsKSwKKwkJICAiPXIiIChkZXN0LT52Y3NyKSA6IDopOworfQorCitzdGF0
aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX192c3RhdGVfY3NyX3Jlc3RvcmUoc3RydWN0IF9fcmlz
Y3Zfdl9leHRfc3RhdGUgKnNyYykKK3sKKwlhc20gdm9sYXRpbGUgKAorCQkiLm9wdGlvbiBwdXNo
XG5cdCIKKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0IgorCQkidnNldHZsCSB4MCwgJTIsICUxXG5c
dCIKKwkJIi5vcHRpb24gcG9wXG5cdCIKKwkJImNzcncJIiBfX3N0cmluZ2lmeShDU1JfVlNUQVJU
KSAiLCAlMFxuXHQiCisJCSJjc3J3CSIgX19zdHJpbmdpZnkoQ1NSX1ZDU1IpICIsICUzXG5cdCIK
KwkJOiA6ICJyIiAoc3JjLT52c3RhcnQpLCAiciIgKHNyYy0+dnR5cGUpLCAiciIgKHNyYy0+dmwp
LAorCQkgICAgInIiIChzcmMtPnZjc3IpIDopOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgX19y
aXNjdl92X3ZzdGF0ZV9zYXZlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpzYXZlX3RvLAor
CQkJCQkgdm9pZCAqZGF0YXApCit7CisJdW5zaWduZWQgbG9uZyB2bDsKKworCXJpc2N2X3ZfZW5h
YmxlKCk7CisJX192c3RhdGVfY3NyX3NhdmUoc2F2ZV90byk7CisJYXNtIHZvbGF0aWxlICgKKwkJ
Ii5vcHRpb24gcHVzaFxuXHQiCisJCSIub3B0aW9uIGFyY2gsICt2XG5cdCIKKwkJInZzZXR2bGkJ
JTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCisJCSJ2c2U4LnYJCXYwLCAoJTEpXG5cdCIKKwkJ
ImFkZAkJJTEsICUxLCAlMFxuXHQiCisJCSJ2c2U4LnYJCXY4LCAoJTEpXG5cdCIKKwkJImFkZAkJ
JTEsICUxLCAlMFxuXHQiCisJCSJ2c2U4LnYJCXYxNiwgKCUxKVxuXHQiCisJCSJhZGQJCSUxLCAl
MSwgJTBcblx0IgorCQkidnNlOC52CQl2MjQsICglMSlcblx0IgorCQkiLm9wdGlvbiBwb3Bcblx0
IgorCQk6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiKTsKKwlyaXNjdl92X2Rp
c2FibGUoKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3RhdGVfcmVzdG9y
ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqcmVzdG9yZV9mcm9tLAorCQkJCQkgICAgdm9p
ZCAqZGF0YXApCit7CisJdW5zaWduZWQgbG9uZyB2bDsKKworCXJpc2N2X3ZfZW5hYmxlKCk7CisJ
YXNtIHZvbGF0aWxlICgKKwkJIi5vcHRpb24gcHVzaFxuXHQiCisJCSIub3B0aW9uIGFyY2gsICt2
XG5cdCIKKwkJInZzZXR2bGkJJTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCisJCSJ2bGU4LnYJ
CXYwLCAoJTEpXG5cdCIKKwkJImFkZAkJJTEsICUxLCAlMFxuXHQiCisJCSJ2bGU4LnYJCXY4LCAo
JTEpXG5cdCIKKwkJImFkZAkJJTEsICUxLCAlMFxuXHQiCisJCSJ2bGU4LnYJCXYxNiwgKCUxKVxu
XHQiCisJCSJhZGQJCSUxLCAlMSwgJTBcblx0IgorCQkidmxlOC52CQl2MjQsICglMSlcblx0Igor
CQkiLm9wdGlvbiBwb3Bcblx0IgorCQk6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1v
cnkiKTsKKwlfX3ZzdGF0ZV9jc3JfcmVzdG9yZShyZXN0b3JlX2Zyb20pOworCXJpc2N2X3ZfZGlz
YWJsZSgpOworfQorCiAjZWxzZSAvKiAhIENPTkZJR19SSVNDVl9JU0FfViAgKi8KIAorc3RydWN0
IHB0X3JlZ3M7CisKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfdmVjdG9yKHZvaWQp
IHsgcmV0dXJuIGZhbHNlOyB9CitzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfcXVl
cnkoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpIHsgcmV0dXJuIGZhbHNlOyB9CiAjZGVmaW5lIHJpc2N2
X3ZfdnNpemUgKDApCiAjZGVmaW5lIHJpc2N2X3Zfc2V0dXBfdnNpemUoKQkJCWRvIHt9IHdoaWxl
ICgwKQorI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxlICgwKQor
I2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQogCiAjZW5k
aWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJh
Y2UuaAppbmRleCA4ODI1NDdmNmJkNWMuLjU4Njc4NmQwMjNjNCAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9wdHJhY2UuaApAQCAtNzcsNiArNzcsMjMgQEAgdW5pb24gX19yaXNjdl9mcF9zdGF0
ZSB7CiAJc3RydWN0IF9fcmlzY3ZfcV9leHRfc3RhdGUgcTsKIH07CiAKK3N0cnVjdCBfX3Jpc2N2
X3ZfZXh0X3N0YXRlIHsKKwl1bnNpZ25lZCBsb25nIHZzdGFydDsKKwl1bnNpZ25lZCBsb25nIHZs
OworCXVuc2lnbmVkIGxvbmcgdnR5cGU7CisJdW5zaWduZWQgbG9uZyB2Y3NyOworCXZvaWQgKmRh
dGFwOworCS8qCisJICogSW4gc2lnbmFsIGhhbmRsZXIsIGRhdGFwIHdpbGwgYmUgc2V0IGEgY29y
cmVjdCB1c2VyIHN0YWNrIG9mZnNldAorCSAqIGFuZCB2ZWN0b3IgcmVnaXN0ZXJzIHdpbGwgYmUg
Y29waWVkIHRvIHRoZSBhZGRyZXNzIG9mIGRhdGFwCisJICogcG9pbnRlci4KKwkgKgorCSAqIElu
IHB0cmFjZSBzeXNjYWxsLCBkYXRhcCB3aWxsIGJlIHNldCB0byB6ZXJvIGFuZCB0aGUgdmVjdG9y
CisJICogcmVnaXN0ZXJzIHdpbGwgYmUgY29waWVkIHRvIHRoZSBhZGRyZXNzIHJpZ2h0IGFmdGVy
IHRoaXMKKwkgKiBzdHJ1Y3R1cmUuCisJICovCit9OworCiAjZW5kaWYgLyogX19BU1NFTUJMWV9f
ICovCiAKICNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfUFRSQUNFX0ggKi8KLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

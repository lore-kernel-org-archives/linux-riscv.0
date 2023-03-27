Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECCDC761A6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AriwCIWQl5GVrfY0DI9ZbhPhDlsPTDguCQtlaORkSNs=; b=PoIwbrfYfXnE6G
	6N6J//5zcMX11V2sxxaSeorVBemwQdlEHBOLgvZcntXRVh7grlLyxZFs3Ywo+RWJCbVWN4AQDD97s
	KRDDb4IxyrkX18ZrPSDhePuciULIWf/QiqtqOwef23wonV0ztuSpasKEmr2hylna+AU4pZt9uBzkj
	sNdlusCVjT8BNumWh/tFjBmWrU6icJT6xTeI+j9pOKoRJJ8WlcfE7vTqUhcsInC22wu+zKmTf1kU+
	nOBT8EN025gyLrEQmk+rI8xXIQFrcT3e42UY055QUijw4KjNcGq/fkFi0yp9mR4PAOlTcou4RXHyU
	IIJvB0hbbtVnjmaosQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgr8q-00ByaP-1z;
	Mon, 27 Mar 2023 18:00:24 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3H-00BlKY-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so12394852pjp.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Udr950R2Z02WuBhnFPF0mNQ6jR2x6UMx+TQ6xeOkBXQ=;
        b=eJkMdCIOK/a37GcACaI9FeNjF/vy+cAVmyKJtJW0FPm/4M33eA4rmCzSd4Nwkg8SCF
         b9W/ioa3yGYIR9hJ2P/UkDIhxLvOSPZh/iP9PHlMWtWgmEk4Iz3pkp5DAugHbiDcaakX
         VAYjw/vJbYcRyun/wua2ah/dpsiJ1KGMTfeMVnxcklur5YGbF1Ms6yMiDFMCIFlwOlTX
         qpoHScNI7OAPDZBufh2VobHgO2sEuWUXzcl5qa3Z/QORLDcmeKkLzIv9dmG7vmLK5KJ5
         RCSLS9UTIAxS1s1ggG3j9iZyE/Id4HOw/p0fx2Es9alpwmO2D9oSH99HcGv6pkMxToZK
         TdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Udr950R2Z02WuBhnFPF0mNQ6jR2x6UMx+TQ6xeOkBXQ=;
        b=6b1965NpYyE41OKhZek4ROF0m/QJv0JlUp6a+82O+rYvTQPecQVYJv8HdfYR+layQj
         0vGaPMqrh3Qnl00Hsmu/Nkt2yDgRR5ntwmkisvsy0XWdUqsdDoNFSEbRjGUQ1zgEErKU
         i4cOrXkpmYV/r8L8H4nZheJwFP5u5TVQTPfULmX0K+yoV8a2SOXe8Y2IgN3ocGcZXqwo
         Q8jsS3ZDeo9GhA0ObTuQgKqBfKgT/Vimr2baFyVn7xwOZcsCrRcT03SSrOzA/KZLeNlX
         59OoBiTilA4nzAhtkvzClIXOi/L+3VUERjwJnm4Gb1oJPXT7KKmqzeRUWoQAcudPkAZY
         2t+Q==
X-Gm-Message-State: AO0yUKW/UokM1LWquLCKnLVmpmZEaaofD1GsnGgyBw5tAKAmN4PHkJ24
	lNA+JZVG+zCXd06pMZdqMc8ubPlT/9KWa7GSQk1Vax+jSPpra21y/fEc9i+oUngsXdXe/bDti0H
	hjA6D7wzgguWhrSeG2nmOMVYAIw17UkPPvCW/x9Wd26x2PkJhAJQuiFXBbddHIc5D7x5ZuuZjmP
	3LuPT4dvHkmZjO
X-Google-Smtp-Source: AK7set/EVgggal0RNDrlrwcfcoyUTEdcnun7QzGdZ6yKGp579tgvpTlFOCX+yvmgSDIemeyL4AiKoQ==
X-Received: by 2002:a05:6a20:bc9e:b0:dd:7661:fb34 with SMTP id fx30-20020a056a20bc9e00b000dd7661fb34mr10387614pzb.51.1679935833878;
        Mon, 27 Mar 2023 09:50:33 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:33 -0700 (PDT)
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
Subject: [PATCH -next v17 08/20] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Mon, 27 Mar 2023 16:49:28 +0000
Message-Id: <20230327164941.20491-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095035_222106_1F5D40E4 
X-CRM114-Status: GOOD (  12.21  )
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

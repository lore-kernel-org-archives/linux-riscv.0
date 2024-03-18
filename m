Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E786C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AB196ukfphtzohvHZUscpnYaA4UaIjD4ARIgrEr2o0=; b=vIwAMNREY2C/OL
	nvLcoLWMr2WOhZJV7TEf5ysUITDTJkVu4OYs7F9ogoJnPGE9duPu/Furw0YYK534DvsNzGIiywZXT
	NSf8yqDirX2gKJfKy/Wcg7Ouaa3aMmKnYs6KP1azSYyUxk3M2GBfiGrYiJYuTZ/nSC2Dm8ezF/kkR
	GuSMUWwoCWrwAHhQbsv3Y7dGT9KtmtUSXxtm/ATdVjOVTmD6qv3DQWISyuvtSZMkjD5T2nzRLaUk0
	w3LpZLtrz6bpKU2BfIIYzVZmLvvH9MKt5xgQtJGLPPaxHifSUJwhbH7HIC+VdbCpNpw22K2bWl+lp
	iZKejNLgV9FCtk9dojiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPg-00000008B0d-3WrK;
	Mon, 18 Mar 2024 10:40:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPc-00000008Awy-2VQk
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e6adc557b6so3926377b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758411; x=1711363211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nNTcXNffy4KdPfHJUqr4Rqkbq2/2XQcn/yEKFcKSuc=;
        b=TaELdJqe93MzpqPxBVd2UPspmCEOpe0lyBn36mNuWbtqlJNwey/qLM7EOLBuzygTuW
         fUEYZ8ZCWb2/XWz2G+5CvoOZMhy0ypqx4/oPlTV1iaXjbzWRAqEhCmwkylLClSsqGogB
         UtoZEovGqTPUkE/ywDQrFSOYiH6sM1lw9JO5jDQ+BMHghm2mtn4sl9VQyoQ0+30PWXgc
         Hld5ID5hRRxa+9QDqfSU/f/XZXRmTciKh/7lAxhVNdiM5znaBq0eDRuf4XGT+WrGPnMw
         FK5EYe2IOp/P9gcnWLCx+boFhNGottVQcNK8/ECIGGSTI0NLwhBXL25Y+NRfLsHkni2n
         zAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758411; x=1711363211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nNTcXNffy4KdPfHJUqr4Rqkbq2/2XQcn/yEKFcKSuc=;
        b=msH1IBc76Mc7dVe/dHGwk+N6Kxrr0LZkT3Ot3/auugTsvKugTo0bIiYbIKFH61OrUr
         MxuGiehjfCTCfAgJGI6QRQnBE9RgEtCrFeiSnXeivZXm57kijCC/SOlghASUSjvWlrGT
         HuSqsErAgRETH8rIOPlsg1JMwt4653IIDKLzKhcciPj4gf4rIOkoyoj0Ffq4e43fQx3b
         OOShMk0OW6Z3GuacnpcYtaLScx8rLBqQ5BmyAOujygRFqH+6dPywBeEK8kmfEurrup9P
         WM5CCHMW8KqUJxS/ebNBy+haQoSoKU4CWM9czuNQVfBveyq0qesfEVlA0crFQxiHoy4U
         dN3w==
X-Gm-Message-State: AOJu0YyF4Pp9y0RorVqiD6w/+P3jg6isigWX5/MmJFDJJqa2Cx2IokVH
	QyQOPbMPZA+CmSuicJEpXx5bYtLhfC3IHIPS6TNmnoSbEg8znDVHEqdYQ8HlkWQ=
X-Google-Smtp-Source: AGHT+IFsD3XyPwieL+ff+1DLNCsk15WFel5OqZJunIAZxacfoadhr6HvNJChmCWf1p/8ZTzzdtfAgQ==
X-Received: by 2002:a05:6a00:1806:b0:6e4:62ed:23c3 with SMTP id y6-20020a056a00180600b006e462ed23c3mr13506206pfa.9.1710758411364;
        Mon, 18 Mar 2024 03:40:11 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:11 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:56 +0800
Subject: [PATCH v3 3/7] riscv: cpufeature: call match_isa_ext() for
 single-letter extensions
MIME-Version: 1.0
Message-Id: <20240318-zve-detection-v3-3-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034012_666784_D14D8914 
X-CRM114-Status: GOOD (  11.95  )
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

U2luZ2xlLWxldHRlciBleHRlbnNpb25zIG1heSBhbHNvIGltcGx5IG11bHRpcGxlIHN1YmV4dGVu
c2lvbnMuIEZvcgpleGFtcGxlLCBWZWN0b3IgZXh0ZW5zaW9uIGltcGxpZXMgenZlNjRkLCBhbmQg
enZlNjRkIGltcGxpZXMgenZlNjRmLgoKRXh0ZW5zaW9uIHBhcnNpbmcgZm9yICJyaXNjdixpc2Et
ZXh0ZW5zaW9ucyIgaGFzIHRoZSBhYmlsaXR5IHRvIHJlc29sdmUKdGhlIGRlcGVuZGVuY3kgYnkg
Y2FsbGluZyBtYXRjaF9pc2FfZXh0KCkuIFRoaXMgcGF0Y2ggbWFrZXMgZGVwcmVjYXRlZApwYXJz
ZXIgY2FsbCB0aGUgc2FtZSBmdW5jdGlvbiBmb3Igc2luZ2xlIGxldHRlciBleHRlbnNpb25zLgoK
U2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KLS0tCkNoYW5n
ZWxvZyB2MzoKLSBSZW1vdmUgc2V0X2JpdCBmb3Igc2luZ2xlLWxldHRlciBleHRlbnNpb25zIGFz
IHRoZXkgYXJlIGFsbCBjaGVja2VkIGluCm1hdGNoX2lzYV9leHQuIChDbMOpbWVudCkKLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxMSArKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKaW5kZXggZGI5ZmI5MGNiMjcyLi5jYmRkNjMxNjVlODUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKQEAgLTQ1NywxNiArNDU3LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByaXNjdl9wYXJzZV9p
c2Ffc3RyaW5nKHVuc2lnbmVkIGxvbmcgKnRoaXNfaHdjYXAsIHN0cnVjdCByaXNjCiAKIAkJaWYg
KHVubGlrZWx5KGV4dF9lcnIpKQogCQkJY29udGludWU7CisKKwkJZm9yIChpbnQgaSA9IDA7IGkg
PCByaXNjdl9pc2FfZXh0X2NvdW50OyBpKyspCisJCQltYXRjaF9pc2FfZXh0KCZyaXNjdl9pc2Ff
ZXh0W2ldLCBleHQsIGV4dF9lbmQsIGlzYWluZm8pOworCiAJCWlmICghZXh0X2xvbmcpIHsKIAkJ
CWludCBuciA9IHRvbG93ZXIoKmV4dCkgLSAnYSc7CiAKLQkJCWlmIChyaXNjdl9pc2FfZXh0ZW5z
aW9uX2NoZWNrKG5yKSkgeworCQkJaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fY2hlY2sobnIpKQog
CQkJCSp0aGlzX2h3Y2FwIHw9IGlzYTJod2NhcFtucl07Ci0JCQkJc2V0X2JpdChuciwgaXNhaW5m
by0+aXNhKTsKLQkJCX0KLQkJfSBlbHNlIHsKLQkJCWZvciAoaW50IGkgPSAwOyBpIDwgcmlzY3Zf
aXNhX2V4dF9jb3VudDsgaSsrKQotCQkJCW1hdGNoX2lzYV9leHQoJnJpc2N2X2lzYV9leHRbaV0s
IGV4dCwgZXh0X2VuZCwgaXNhaW5mbyk7CiAJCX0KIAl9CiB9CgotLSAKMi40NC4wLnJjMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

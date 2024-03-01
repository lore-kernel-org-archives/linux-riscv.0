Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8F4C54798
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 02:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dT2Oi8+EeNdiwqqup9WypLeThlFwQFhpiqJPKjYTvU4=; b=Qp+llGVjF9YM8d
	qH/79dSPpijc+fYXjQd7D0i23nc9/xE4O+pZFD3NiHTHseyUrxEMVu6rEohUVv4GRgfzr3Ti9AJtN
	Z+a/LSv/U8domYUejqc+dySoZUNlXnr4yfzQOfMy0H/ggiTxTGWuW0RQvBdWggUMGL0V1Y1oIlttS
	H59hHAahsQ0/LiPpuz3+mMnmc1ddIszHq6tU8xGhza6mQjcXb8SuSOjFFmikmJBCZLXIK5sF4UOrQ
	898nxmLWR4F4MxC1mYrVJdRUE3vn+z7eUwFEmIUpqrFsvlP3H06T+J33mHcG7alTS+5xxm2J17XjD
	BHzjYE9SH9O0r48o7MGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfskT-0000000G20e-0Lpu;
	Fri, 01 Mar 2024 02:35:45 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfskP-0000000G1zs-19Pb
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 02:35:43 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-21f70f72fb5so1093518fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 18:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709260539; x=1709865339; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh6qJCEZpQBvmWFilxbrLHFctqEFyZZjaDr9WwUS5pg=;
        b=PyexYD1e6SncrhSYAvOl3ccJ0bVr05FrbowvnIZN9D6YgX82dwaA31Hjoh6Mt5nPIw
         Kmi8kB+iCOt+hJ4NS62+xPws55+20F2bAq4rkSXsIm1jge22CP6H9UqyflthQ4V7wqYA
         fPtWjo5XWhFN96aVtyw6TPcGrWwgSKsIWkVDxaqVcYuyh/vjosZ6opSnlwvMiS+AWPrL
         ZaTO8MD0u/VJD6xMx7XEDnTZ9cSgeOR3pqNW77VVPYPWiaO1YcRIpz066DH200QO8iqR
         KV22zMbjDxfb4EBptfaIsZhx0rafRawIEPIOxLNwZ9pY8ZgmbvfPFcTS4CuuzuJNGPom
         p5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709260539; x=1709865339;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lh6qJCEZpQBvmWFilxbrLHFctqEFyZZjaDr9WwUS5pg=;
        b=tgaDxZdy9r3z1FmVKYgRqqnSt3GRt0N0TlOU1DVNr5GOrGlb8baOelgwIrUaj2wNQ/
         /p8JXZUP7OUphlGDUN8SyKTZFcD0QdVGnnXgMwJCZ0vBDJs/FjtTs3o5FM0tfBNM8fO+
         VIF2F7gxiCofIjTvzKxRvLz7FJkLI9bPmI8yCz1AEzRuH4y0IcC+XynXZBqeoN1IJ1m5
         z5Tk0Z5c5GoJ5AYb6JLYpkJlxVGNfNnx/3LdPz9Tk4DGfYtY6k1+3gLXpOR//b2qwNEr
         Zpt+a7RG1avZZJF/JmuJAag+5RjsGJdCStoOi0z8ZG6l6jjs+nctT7OOpQ+C5F3QITiJ
         d5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWwUB+Vxz/HAbsFahY2ZONbx3nb7ZHr4WZfyJmsq5UEiOxe/Hp8jBwLrp82Ay7oo6XXjYUv6+1h+qW2SeUrMRCFI2OPkf447g5QLQumEZlr
X-Gm-Message-State: AOJu0Yzj+XE0Fz5Cq5vtBgTVnA/hyXm0DUMZBZ+UVw4NCq6jSeTg2Y/L
	WXwDM7hvfKEukedGStOPv57E1cH3f2NyA8h5spBgWmxqdXByCxLriZepDpQNk/s=
X-Google-Smtp-Source: AGHT+IF5bsI4g8wt/IkPeVjUQ4V+p/RW1nJIgEQgUn9hCCSy3ND0WkQ+I4bQXUN7g8xxexqttVVknQ==
X-Received: by 2002:a05:6870:6586:b0:21e:7751:312c with SMTP id fp6-20020a056870658600b0021e7751312cmr388369oab.30.1709260538780;
        Thu, 29 Feb 2024 18:35:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d15-20020a63fd0f000000b005dc87643cc3sm2005261pgh.27.2024.02.29.18.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 18:35:38 -0800 (PST)
Message-ID: <65e13efa.630a0220.6b431.a50e@mx.google.com>
Date: Thu, 29 Feb 2024 18:35:38 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: riscv-for-linus-6.8-rc4-22-ga11dd49dcb937
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed,
 2 warnings (riscv-for-linus-6.8-rc4-22-ga11dd49dcb937)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_183541_835464_3E41CD9C 
X-CRM114-Status: UNSURE (   2.30  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQsIDIgd2Fybmlu
Z3MgKHJpc2N2LWZvci1saW51cy02LjgtcmM0LTIyLWdhMTFkZDQ5ZGNiOTM3KQoKRnVsbCBCdWls
ZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZml4ZXMv
a2VybmVsL3Jpc2N2LWZvci1saW51cy02LjgtcmM0LTIyLWdhMTFkZDQ5ZGNiOTM3LwoKVHJlZTog
cmlzY3YKQnJhbmNoOiBmaXhlcwpHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjgtcmM0
LTIyLWdhMTFkZDQ5ZGNiOTM3CkdpdCBDb21taXQ6IGExMWRkNDlkY2I5Mzc2Nzc2MTkzZTE1NjQx
Zjg0ZmNjMWU1OTgwYzkKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1
cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0xMCk6IDEg
d2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJuaW5nCgoK
V2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdh
cm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBd
IFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXIt
ZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25m
aWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3YXJuaW5nLCAwIHNlY3Rp
b24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1cml0eS5jOjgxMDoyOiB3
YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAw
XSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJp
c2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24g
bWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9
biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcsIDAgc2VjdGlv
biBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdh
cm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBd
IFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05G
SUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdz
LCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIx
MF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5n
cywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2sy
MTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJu
aW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11
X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3Jz
LCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9y
ZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

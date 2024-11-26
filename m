Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED453D3B996
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rj2Nx3KZXohTGnRQt4AhITPIOp2ti35oLupHeaJNw34=; b=hn6nqEsDWBg9vQ
	leQpKBjQrY2OX9052pVVkNkHbuzksZNcqBmF222E0M/Zy1vugzi+QMDQ8Gqovv6npLKuzq3gTztkD
	5bnnsNpdXa4wwJSidooxPU2938+TnvKorq61I+3xulRYzGa3P8HK4nwIll4JCTznuA1jz0uJaX8rv
	yazxXIUD4lNu2hBNX9SO0etBVGj0+g0S4xGEZyTVktmEsuBsGNfMZCifIJdPZWCS5pM3HKq98NClG
	vPUiJT+6pk3CRCMgfO2YAFBHOr4TZReftfJAQawtgnjkMDVTYO2IqzozC/CqFb/uYzHNMxWpwogee
	sjZwDXjNUGz8C0no/clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwcs-0000000AsPO-0cWD;
	Tue, 26 Nov 2024 14:33:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwco-0000000AsMv-2hPD
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 14:33:12 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7245a9d0e92so6315878b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Nov 2024 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732631589; x=1733236389; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=mupxBHsaoCYNVEDwdoHYv6SSRLAF/zY+Vk0gFGxEgOg=;
        b=3awDRFiLkFHKl+TmLCmJJWGTzVfCgUwbweRZTedwGDNNYhGmopr55XNjcZdCcqZsNO
         L5/lN4EwV3uIWFiZLRuZRmesHnbq9mI7oL6W1h3sLwNcm6vy3Wlp7WZDmL9ieFm8jkqa
         3EDRfVXpoNz64WYm9Pntp1gcdGvKosXCR4JajSFwc47XDS0evrQfMRguikF5SyR+nFsG
         bWpNhqPlhc5kxGNzCLqMbJZTie+6Ycikk81Su4DU1RfH3/xj3ArmvwpuuftFZIaIx22T
         pKhF/ZJIDgg5dvHqBVD6KjHOlRtKXTGW/d7BW7VqMUFInk4b0azxKZm8WklHPZ/Knv62
         M/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732631589; x=1733236389;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mupxBHsaoCYNVEDwdoHYv6SSRLAF/zY+Vk0gFGxEgOg=;
        b=WWE7+DcvF/eagDVEVG+1rzDgM1TSWJ9L+aZ8eE5D/Ex3cFd54YzpHMrbxePCMeY+3J
         lfkys6OnK34+t9r+RppTJHRAENPYHheAgiV8yqBZ3enBERM1g+Zt7Jl9gpa9bRBffqrB
         hzk3ifF0kkq0iY+0wihLg81KjznSWO24VlZ2cFfbRyLm2m1kv5cGUY55vfBypvGXRp7X
         03WSC+gutlNNEd7HxV9m+n5RUZcdsr7xAcdU0LkwIXCw0eviBy8lyxK0Sby2WHHb4agg
         4M8DvxC75xrmOe14g75E09seOOAY5SzkinSkb1XWVqglSMfw3xqOFZvwuTVnfNtjgvvV
         dyLw==
X-Gm-Message-State: AOJu0Yyjl77ZYxxlHze+2dGYKEMXVZ8vbaLTZQQ6uSWbjePuB/bN4Fzk
	YuKTY+9ODtXjhyQXLWGWsrnLIPxJvi0icCFbuybtJZWtH5xg++k5tcsFpQvAJO+1qg+x9F0cZKe
	h
X-Gm-Gg: ASbGnctUBzKRo7Z9zMqF6rHQj78vDn4Q7hxww2KLFJCh9YnPDobg+qTphtxx9SdGQM2
	pGx7XToP9I0IGcCzLddfGQXCOqRp7whGocDgx5y1YwDyKW0kEgOutUijV9qAHiWMx4u4jgZg8cN
	aKyF1SN4IOmuhVRdazePLwb4+q71f3OhhozqFetYpKJ3CGgD48h/RahzleRAqmz2Mr8igxnSlRq
	VUIv0arVFK7JakCLoC3jm1GuwMJZiYW9B0buAvCQKXNcDtF
X-Google-Smtp-Source: AGHT+IF+rcJZjnN6V6SKmX3MXts9npgA2UuoNeWqP83fdeNumO/mz1uFb5TDfGJJ+sw6pVK5at/pxw==
X-Received: by 2002:a05:6a00:2d10:b0:71e:3b8:666b with SMTP id d2e1a72fcca58-724df604670mr16595256b3a.15.1732631588932;
        Tue, 26 Nov 2024 06:33:08 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47d186sm8472744b3a.76.2024.11.26.06.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 06:33:08 -0800 (PST)
Subject: [PATCH] RISC-V: Remove unnecessary include from compat.h
Date: Tue, 26 Nov 2024 06:32:50 -0800
Message-ID: <20241126143250.29708-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_063310_947708_C28D8063 
X-CRM114-Status: GOOD (  10.17  )
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

V2l0aG91dCB0aGlzIEkgZ2V0IGEgYnVuY2ggb2YgYnVpbGQgZXJyb3JzIGxpa2UKCiAgICBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L3NjaGVkL3Rhc2tfc3RhY2suaDoxMiwK
ICAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0
Lmg6MTIsCiAgICAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaDoxMTUsCiAgICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4
L3BndGFibGUuaDo2LAogICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9t
bS5oOjMwLAogICAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvcmlzY3Yva2VybmVsL2FzbS1v
ZmZzZXRzLmM6ODoKICAgIC4vaW5jbHVkZS9saW51eC9rYXNhbi5oOjUwOjM3OiBlcnJvcjog4oCY
TUFYX1BUUlNfUEVSX1BUReKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKTsg
ZGlkIHlvdSBtZWFuIOKAmFBUUlNfUEVSX1BUReKAmT8KICAgICAgIDUwIHwgZXh0ZXJuIHB0ZV90
IGthc2FuX2Vhcmx5X3NoYWRvd19wdGVbTUFYX1BUUlNfUEVSX1BURSArIFBURV9IV1RBQkxFX1BU
UlNdOwogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+CiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFBUUlNfUEVSX1BURQogICAgLi9pbmNsdWRlL2xpbnV4L2thc2FuLmg6NTE6ODogZXJyb3I6
IHVua25vd24gdHlwZSBuYW1lIOKAmHBtZF904oCZOyBkaWQgeW91IG1lYW4g4oCYcGdkX3TigJk/
CiAgICAgICA1MSB8IGV4dGVybiBwbWRfdCBrYXNhbl9lYXJseV9zaGFkb3dfcG1kW01BWF9QVFJT
X1BFUl9QTURdOwogICAgICAgICAgfCAgICAgICAgXn5+fn4KICAgICAgICAgIHwgICAgICAgIHBn
ZF90CiAgICAuL2luY2x1ZGUvbGludXgva2FzYW4uaDo1MTozNzogZXJyb3I6IOKAmE1BWF9QVFJT
X1BFUl9QTUTigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3Ug
bWVhbiDigJhQVFJTX1BFUl9QR0TigJk/CiAgICAgICA1MSB8IGV4dGVybiBwbWRfdCBrYXNhbl9l
YXJseV9zaGFkb3dfcG1kW01BWF9QVFJTX1BFUl9QTURdOwogICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CiAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUlNfUEVSX1BHRAogICAgLi9pbmNs
dWRlL2xpbnV4L2thc2FuLmg6NTI6ODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHB1ZF90
4oCZOyBkaWQgeW91IG1lYW4g4oCYcGdkX3TigJk/CiAgICAgICA1MiB8IGV4dGVybiBwdWRfdCBr
YXNhbl9lYXJseV9zaGFkb3dfcHVkW01BWF9QVFJTX1BFUl9QVURdOwogICAgICAgICAgfCAgICAg
ICAgXn5+fn4KICAgICAgICAgIHwgICAgICAgIHBnZF90CiAgICAuL2luY2x1ZGUvbGludXgva2Fz
YW4uaDo1MjozNzogZXJyb3I6IOKAmE1BWF9QVFJTX1BFUl9QVUTigJkgdW5kZWNsYXJlZCBoZXJl
IChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhQVFJTX1BFUl9QR0TigJk/CiAg
ICAgICA1MiB8IGV4dGVybiBwdWRfdCBrYXNhbl9lYXJseV9zaGFkb3dfcHVkW01BWF9QVFJTX1BF
Ul9QVURdOwogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+CiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBUUlNfUEVSX1BHRAogICAgLi9pbmNsdWRlL2xpbnV4L2thc2FuLmg6NTM6ODogZXJy
b3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHA0ZF904oCZOyBkaWQgeW91IG1lYW4g4oCYcGdkX3Ti
gJk/CiAgICAgICA1MyB8IGV4dGVybiBwNGRfdCBrYXNhbl9lYXJseV9zaGFkb3dfcDRkW01BWF9Q
VFJTX1BFUl9QNERdOwogICAgICAgICAgfCAgICAgICAgXn5+fn4KICAgICAgICAgIHwgICAgICAg
IHBnZF90CiAgICAuL2luY2x1ZGUvbGludXgva2FzYW4uaDo1MzozNzogZXJyb3I6IOKAmE1BWF9Q
VFJTX1BFUl9QNETigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5
b3UgbWVhbiDigJhQVFJTX1BFUl9QR0TigJk/CiAgICAgICA1MyB8IGV4dGVybiBwNGRfdCBrYXNh
bl9lYXJseV9zaGFkb3dfcDRkW01BWF9QVFJTX1BFUl9QNERdOwogICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CiAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUlNfUEVSX1BHRAoKU2lnbmVk
LW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NvbXBhdC5oIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oCmluZGV4IGFhMTAzNTMwYTVjOC4uNjA4MTMyN2U1NWY1
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKQEAgLTksNyArOSw2IEBACiAgKi8KICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Ci0jaW5jbHVkZSA8bGlu
dXgvc2NoZWQvdGFza19zdGFjay5oPgogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NvbXBhdC5oPgog
CiBzdGF0aWMgaW5saW5lIGludCBpc19jb21wYXRfdGFzayh2b2lkKQotLSAKMi40NS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

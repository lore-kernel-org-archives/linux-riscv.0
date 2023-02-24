Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE625C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v+h/MvOf9pU89uFD1cbnb8XKH+OFgdBzd4aGd+d9Ocw=; b=41rVlVno/JBCdl
	fwoZ6x9gsyErdPOGd/0jsYTCGGR9M6f9PMo5yILfOxbnJHEiaYrx4TyMV7z+da1maws1Ns9CUa/48
	rC9RWitn1KRb1zfwe3/QjD8Old5fPem6+2GL8p3TB1HweB1qt8CYUr/cMVk5d3/PTs+YHBIcC+h//
	RAEcOJZwfsgax4A8meviTGdPAoR24fSRqA9u+5/4s1IWVwB65gVfb3K+2PKYeHLQS9Xii+sFIQC23
	XaYMLy11grlA/JsgCyq+0eFDgSVIN7jg6TqUUeBXDbxqDqeQdktOdTRDpSnJHZM6H9aBJC3i++VYz
	NuZ9rycN/mzBx1P1Je1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUuN-001qDF-1c; Fri, 24 Feb 2023 10:02:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUuK-001qAM-0C
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 10:02:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id bt28so6666612wrb.8
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgTiDDsfaHP7jVew0rXgrkZhb05V4kPRInLQ8/UIVxU=;
        b=SmTacAhXaRqBZ9fg0/Pw7HwF4ypCxgeWSOEEpguNsAWFgbxZ6RW0G8FWQfT2Grz/zH
         YuFAJJlBt5NWeJSEF8pDOFnWP9k5MoVG+N4mffLhbvnP8WDDhfphepvAtr8lDCu6GAQ6
         kGHIa6rBH5T8OTDxya8R73Lm1H3Zqq+iTpibbZqbiJ/SLlPqWpC6FVExaPjTtv9LIMW3
         upCo2N/z9TcJRLCcsaN36Q+nl13uG1tIUNhzRHWNc79xQ2CvkIpYIk4PP9/v7r5p14Fa
         EUVB6f+X/cdGR6pJG3+zKW9TkQ+TEHHe8dpWL4w2DiX/uuioqYO/syE3OqC47re2VbJW
         2LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgTiDDsfaHP7jVew0rXgrkZhb05V4kPRInLQ8/UIVxU=;
        b=pgO7mzIFD2dqGPm+lxmAwksa4vCbeVghcKJpktPkTRTlr1NJSA+gdS+qMRetx5chC9
         YYiBVHSeEPR1ZIpyPE3tpvZGVnsqrp/DzudaHnKvl5uP56ii72AkoCzGO64oJnHqZKf+
         aZQVwVt9Zl+EpUvH95CBvtRV+CkaxK21R3EDKHPK72T/eSYLLj/43lOgmm3618kUVuf4
         PMfDYe3TU4C7mz3TZkG6xF/VPrWrwZnfd/gYXD1+K1hUnNStIYcroEoAIRu711G2h/jd
         tKFIYQ6ClScYPP3De3zb70vBq5zl/+yc5owwcBK8aUIwKaXXxivsKO+Q2ztcJPlISGh7
         Le5g==
X-Gm-Message-State: AO0yUKWuNwEQu3DNRxSO6jLKKqDpqryrJF3Io4nxMaP+WM4uCMXgM/ha
	Az/cil72kcr386xtyuhMzjZmkg==
X-Google-Smtp-Source: AK7set8mY1ChiX0wV8ujiGBzXbIYnfB2xYPTAyRwTS+YhheiWY3mHU8T0lZoOqgaQ1NDGWtOicy93Q==
X-Received: by 2002:a5d:5486:0:b0:2be:c41:4758 with SMTP id h6-20020a5d5486000000b002be0c414758mr11725398wrv.38.1677232944108;
        Fri, 24 Feb 2023 02:02:24 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4b8f000000b002c561805a4csm14572802wrt.45.2023.02.24.02.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 02:02:23 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Fri, 24 Feb 2023 11:02:17 +0100
Message-Id: <20230224100218.1824569-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020228_258115_50378FFE 
X-CRM114-Status: GOOD (  15.99  )
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

VGhpcyBuZXcgdmVyc2lvbiBnZXRzIHJpZCBvZiB0aGUgbGltaXRhdGlvbiB0aGF0IHByZXZlbnRl
ZCBLQVNBTiBrZXJuZWxzICAgICAgICAgCnRvIHVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBwYXJh
bWV0ZXJzLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKV2hpbGUgbG9va2luZyBpbnRvIEtBU0xSLCBJIGZlbGwgb250byBj
b21taXQgYWFjZDE0OWI2MjM4ICgiYXJtNjQ6IGhlYWQ6ICAgICAgICAgCmF2b2lkIHJlbG9jYXRp
bmcgdGhlIGtlcm5lbCB0d2ljZSBmb3IgS0FTTFIiKTogaXQgYWxsb3dzIHRvIHVzZSB0aGUgZmR0
ICAgICAgICAgIApmdW5jdGlvbnMgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIHdpdGgg
S0FTQU4gZW5hYmxlZCBieSBzaW1wbHkgICAgICAgICAgICAKY29tcGlsaW5nIGEgbmV3IHZlcnNp
b24gb2YgdGhvc2UgZnVuY3Rpb25zIHdpdGhvdXQgaW5zdHJ1bWVudGF0aW9uLiAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIApJIGhhZCB0byBjaGFuZ2UgdGhlIGhhbmRsaW5n
IG9mIHRoZSBjb21tYW5kIGxpbmUgcGFyc2luZyB0byBtYWtlIHRoZSAgICAgICAgICAgICAKY29k
ZSBzZWxmLWNvbnRhaW5lZCBpbiBrZXJuZWwvcGkvY21kX2Vhcmx5LmMgdG8gYXZvaWQgY2FsbGlu
ZyB0b28gbWFueSAgICAgICAgICAgCl9fcGkgcHJlZml4ZWQgZnVuY3Rpb25zIGZyb20gb3V0c2lk
ZSB0aGlzIGZpbGUuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKSSdsbCB1c2UgdGhpcyBhcHByb2FjaCBsaWtlIGFybTY0IHRvIGhhbmRs
ZSB0aGUgZXh0cmFjdGlvbiBvZiB0aGUgcmFuZG9tICAgICAgICAgCnNlZWRpIGZyb20gdGhlIGRl
dmljZSB0cmVlIGZvciBLQVNMUi4gCgpiYXNlLWNvbW1pdDogZWI5YmU4MzEwYzU4ICgiUklTQy1W
OiBhZGQgYSBzcGluX3NoYWRvd19zdGFjayBkZWNsYXJhdGlvbiIpCgp2NzoKLSBSZWJhc2VkIG9u
IHRvcCBvZiBmb3ItbmV4dCB3aGljaCBpbnRyb2R1Y2VzIGxvdHMgb2YgZXJyb3JzICh0aGFua3Mg
dG8KICB0aGUgcGF0Y2h3b3JrIENJKQotIEFkZCBfX05PX0ZPUlRJRlkgdG8gYXZvaWQgdW5kZWZp
bmVkIF9fcGlfZm9ydGlmeV9wYW5pYwotIEFkZCBhbiBhbGlhcyB0byBvdXIgbmV3bHkgaW50cm9k
dWNlZCBzdHJsZW4KLSBSZW1vdmUgX19pbml0IGFzIHNlY3Rpb25zIGFyZSBhbHJlYWR5IHByZWZp
eGVkIGluIHRoZSBNYWtlZmlsZQotIEludHJvZHVjZSBuZXcgc2VjdGlvbiBmb3Iga2VybmVsL3Bp
L3N0cmluZy5jIHRvIHF1aWV0IHRoZSBmb2xsb3dpbmcKICB3YXJuaW5ncyAob25jZSB3ZSBoYXZl
IGFsbCB0aGUgc3RyaW5nIGZ1bmN0aW9ucywgd2UnbGwgYmUgYWJsZSB0byBnZXQKICByaWQgb2Yg
dGhpcyk6Cgp3YXJuaW5nOiBvcnBoYW4gc2VjdGlvbiBgLmluaXRfX2J1Z190YWJsZScgZnJvbSBg
YXJjaC9yaXNjdi9rZXJuZWwvcGkvc3RyaW5nLnBpLm8nIGJlaW5nIHBsYWNlZCBpbiBzZWN0aW9u
IGAuaW5pdF9fYnVnX3RhYmxlJwp3YXJuaW5nOiBvcnBoYW4gc2VjdGlvbiBgLmluaXQuc3JvZGF0
YS5jc3Q4JyBmcm9tIGBhcmNoL3Jpc2N2L2tlcm5lbC9waS9zdHJpbmcucGkubycgYmVpbmcgcGxh
Y2VkIGluIHNlY3Rpb24gYC5pbml0LnNyb2RhdGEuY3N0OCcKCnY2OgotIEZpeCBsbHZtIHdhcm5p
bmcgYnkgZm9yd2FyZCBkZWNsYXJpbmcgc2V0X3NhdHBfbW9kZV9mcm9tX2NtZGxpbmUKCnY1OiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAotIEhhbmRsZSBudWxsIGNvbW1hbmQgbGluZSwgVGhhbmtzIEJq
w7ZybiEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCi0gQWRkIFJCL1RC
IGZyb20gQmrDtnJuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCnY0OiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAotIEludHJvZHVjZSBwaS8gZm9yIEtBU0FOIHRvIHdvcmsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CnYzOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAotIE1hc3NhZ2UgY29tbWl0IGxvZyB0byBtYWtlIG5v
NGx2bCBjbGVhcmVyLCBhcyBhc2tlZCBieSBDb25vciAgICAgICAgICAgICAgICAgICAKLSBBZGQg
YSBub3RlIHRvIGtlcm5lbC1wYXJhbWV0ZXJzLnR4dCByZWdhcmRpbmcgdGhlIGltcG9zc2liaWxp
dHkgdG8gdXNlICAgICAgICAgCiAgdGhvc2UgcGFyYW1ldGVycyB3aGVuIEtBU0FOIGlzIGVuYWJs
ZWQsIGFzIHN1Z2dlc3RlZCBieSBDb25vciAgICAgICAgICAgICAgICAgIAotIEFkZCBSQiBmcm9t
IEJqw7ZybiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAp2MjogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKLSBIb25vciBDTURMSU5FX0VYVEVORCBhbmQgQ01ETElORV9GT1JDRSBhcyBub3RpY2Vk
IGJ5IEJqw7ZybgoKQWxleGFuZHJlIEdoaXRpICgxKToKICByaXNjdjogQWxsb3cgdG8gZG93bmdy
YWRlIHBhZ2luZyBtb2RlIGZyb20gdGhlIGNvbW1hbmQgbGluZQoKIC4uLi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBhcmNoL3Jpc2N2L2tlcm5lbC9waS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgfCAzNyArKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJu
ZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAgIHwgNjIgKysrKysrKysrKysrKysrKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC5sZHMuUyAgICAgICAgICAgICAgIHwgIDcgKysrCiBh
cmNoL3Jpc2N2L2xpYi9tZW1jcHkuUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBhcmNo
L3Jpc2N2L2xpYi9tZW1tb3ZlLlMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiBhcmNoL3Jp
c2N2L2xpYi9zdHJsZW4uUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2
L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzNiArKysrKysrKystLQogOSBm
aWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9waS9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BpL2NtZGxpbmVfZWFybHkuYwoKLS0gCjIuMzcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

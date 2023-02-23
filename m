Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0E4C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsZteN/mlhc/0WU421IHz7mmu5AB+98noJL/xdflQuU=; b=Ln0wHSiQ456n6X
	VxrTm7hl8zG48YAeSqqzDvw2iWy/FqDLH9RNlPjAHDBd1v7DFCREQpGDgKVhuUavY5T1q6YYWK7Bb
	0w2IPYyxQQejehB5M1ModfgHl84yGIgXjMS+Oby68u6o8xQBCLSAMDSMxOHD83oj/9x9rFM4RZjsO
	tjDC81+QPVsSjOiCwIrQ635wrgVQceMnzGCOEMo8HX3DMVsWz9Y1E0FsKkjEP1GSFL53MTMY5Y4on
	fJecgW7OeRBJ1rJj1xVpAaukQYCXmcQY+AFFL6ZoM+vkZ3EiPATVx5URlDcqYsKZ/t1mJa2RiW8cx
	rUd71SuGPoFr11tNXNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6uF-00FXFH-Rz; Thu, 23 Feb 2023 08:24:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV6uD-00FXDx-4w
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 08:24:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id bo30so9387672wrb.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 00:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkCh/AowqYCuU7zgqG0YkYb4oopQxez3cQvz40pUaxs=;
        b=RhAY7mQUp4U96B+Jiym9qVEPn1CiYxJWT2NGE4QjO8auQi1R8vtku5RKL4sN28AH4a
         dET6hsct+g7jUMueitQaqULSml1pIBpVIh4UVtqD+GGOLkIm3ViBqEmIU1jnzyZPCO2X
         AESs5WkmjDcGRwfytFKw8w2578YQu9SmvW/3VnWXhMM17YdBiUv+oH1DvtjEWM6iqpEt
         58GoG5DQgHCXzaa+VqicCPhzKAzPGFYH5Bxqd84RWSBJRETkGDYbQVBaZSsrl8FPRQBF
         8Ix999uVP0F6iuqeyGRMFLc9fQa1bkGiL5rdT66O9QamOiqj8VEr738gXCrhK44UTw3y
         +byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkCh/AowqYCuU7zgqG0YkYb4oopQxez3cQvz40pUaxs=;
        b=03uLKIlCaAIKneWDNg0He1jmM8q/nSqPhKwqKvaJ6fJ7425ZBxnCyD59AlDfhjNPxR
         4eRt4UwdpVuzhKUuDetLJ0eYeDaQMQZ01VxKDpwBwB2xvyfEk5rtHGmiI4yL/KWGGzQU
         +izRopY5dkhWq4CY/qHetyXeyzJabC6FPt1+S8ogt3pWiCZo6p4U1rmUpWFW/cy2WoRa
         N7tyBY7E7BNd/lvuC3CCMDtNqSUOGrXRicGTvor26pCpEfWys1N8zQI7F47kWTLOm6PZ
         iG+Bb3tOxROXq03D4WuLh7IyuKx7J1bfO8ar4iMgC5P6/mjNBUtlmOlnifBAytq3OT0Y
         2mtA==
X-Gm-Message-State: AO0yUKUxcqN5pax+RmdBNWEr5uU+f2KtdcZKg2KlG//9AvMkbuaOhx8V
	A16baZ5F67p8JrwlZ1PZlvxwwQ==
X-Google-Smtp-Source: AK7set9k+etAhHHJfifyrCS12MhqVoE/6gxFjtGmJJM/kJJFfJR/OvWvQZARuqkvX0qL24LuBVs1xg==
X-Received: by 2002:a05:6000:18b:b0:2c5:4f35:1b2b with SMTP id p11-20020a056000018b00b002c54f351b2bmr9833138wrx.28.1677140681204;
        Thu, 23 Feb 2023 00:24:41 -0800 (PST)
Received: from alex-rivos.home (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id i18-20020adfe492000000b002c56287bd2csm9858338wrm.114.2023.02.23.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 00:24:40 -0800 (PST)
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
Subject: [PATCH v6 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Thu, 23 Feb 2023 09:24:33 +0100
Message-Id: <20230223082434.1280957-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_002445_396411_A9DE8DB6 
X-CRM114-Status: GOOD (  13.89  )
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
dmljZSB0cmVlIGZvciBLQVNMUi4gCgpiYXNlLWNvbW1pdC10YWc6IHJpc2N2LWZvci1saW51cy02
LjItcmM4Cgp2NjoKLSBGaXggbGx2bSB3YXJuaW5nIGJ5IGZvcndhcmQgZGVjbGFyaW5nIHNldF9z
YXRwX21vZGVfZnJvbV9jbWRsaW5lCgp2NTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKLSBIYW5kbGUg
bnVsbCBjb21tYW5kIGxpbmUsIFRoYW5rcyBCasO2cm4hICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAotIEFkZCBSQi9UQiBmcm9tIEJqw7ZybiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAp2NDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKLSBJbnRyb2R1Y2UgcGkvIGZvciBL
QVNBTiB0byB3b3JrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAp2MzogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKLSBN
YXNzYWdlIGNvbW1pdCBsb2cgdG8gbWFrZSBubzRsdmwgY2xlYXJlciwgYXMgYXNrZWQgYnkgQ29u
b3IgICAgICAgICAgICAgICAgICAgCi0gQWRkIGEgbm90ZSB0byBrZXJuZWwtcGFyYW1ldGVycy50
eHQgcmVnYXJkaW5nIHRoZSBpbXBvc3NpYmlsaXR5IHRvIHVzZSAgICAgICAgIAogIHRob3NlIHBh
cmFtZXRlcnMgd2hlbiBLQVNBTiBpcyBlbmFibGVkLCBhcyBzdWdnZXN0ZWQgYnkgQ29ub3IgICAg
ICAgICAgICAgICAgICAKLSBBZGQgUkIgZnJvbSBCasO2cm4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKdjI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCi0gSG9ub3IgQ01ETElORV9FWFRFTkQg
YW5kIENNRExJTkVfRk9SQ0UgYXMgbm90aWNlZCBieSBCasO2cm4KCkFsZXhhbmRyZSBHaGl0aSAo
MSk6CiAgcmlzY3Y6IEFsbG93IHRvIGRvd25ncmFkZSBwYWdpbmcgbW9kZSBmcm9tIHRoZSBjb21t
YW5kIGxpbmUKCiAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAgICAg
fCAgNSArLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwg
IDIgKwogYXJjaC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgMzQg
KysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAg
IHwgNjIgKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9saWIvbWVtY3B5LlMgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9saWIvbWVtbW92ZS5TICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMzYgKysrKysrKysrLS0KIDcgZmlsZXMgY2hhbmdlZCwgMTM2IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJu
ZWwvcGkvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9waS9j
bWRsaW5lX2Vhcmx5LmMKCi0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==

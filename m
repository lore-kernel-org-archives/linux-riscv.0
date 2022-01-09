Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5CDC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jan 2022 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5wU/mypJ9Oqalov439YYQH/fjrserndos7dQJecyX+I=; b=XtFHLGmQYmq6gK
	wT9y/BevESMD0/Dyp8+yIR39YXY2mQsTJqMmAPUJC9WMg8GjC8YMqW0ckBN2Dl+786VfYRPrdiXXo
	bF82aeLgSbDW0smOT0EBzprJd1J5TX8Vc/fd20s3jTmUJzhD3b7fvf7XbEDGRLewwo/1erkxhHa2b
	5oNvQqrl6/tUpjqvZ9YGfElrvde/8eUpbDF1W9uJauv/MSW/9QfmRvSqUbFqWGo4NZNs2KMi13mO1
	YN/JGKBk27U6Xlc67ZRj1LDJKwLRIbTQECxroYlmWcJFaKiBmk1fsfhmXkKZr51x/4mnYaQD3Q2ch
	YgCFJ7K6Jv4OJkiwSEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6VTY-007dYK-8I; Sun, 09 Jan 2022 10:31:00 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6VTV-007dXw-78
 for linux-riscv@lists.infradead.org; Sun, 09 Jan 2022 10:30:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id h2so33722265lfv.9
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 02:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N4VdQMqsU42J/GEtn26CNy7dQyd3XcaQCO8occ40GHM=;
 b=OFm1RWF3fqvuETUznHVtNEAWeLbEC+02APKkRHAzF9/myPNYLmGA+PIIHRYcs6Xq5X
 AJ9Oq4HWg62AjRymHnSNklD/Et97gG6BUMCJmFEsC9ggGtWZ57H8X90DtU9YhKJVmxfU
 XrliQQNid/+GNkv0rSosFrznDzLVUIEVWMjOgyGyUVO0YFlD+pJrpqKjqgH9e/ExRK7j
 1Hcyz28/QDtN4wG9t0MiNMFI6kA/NmcokUlI4LhiCIzrroGAuysrJnYK312g09KrEbWV
 yTHSTuEB+SKgSUqz5Q6CIXugv4iTwykOzbms4JS+eGygTyY0KxXRJ/ZSuZzq+UZjSR3d
 Te0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=N4VdQMqsU42J/GEtn26CNy7dQyd3XcaQCO8occ40GHM=;
 b=ARk3uBa3Eqa0NPexBTULLXDVrbwA4umzIIusoRzgMdFGMb+5yCvitMKOrNIfXJLoed
 Zhy2TuyJdDlPbyVEHnmTi5UI/Po4n42gl1mm8SKT7CitqicbKnVU8kJreKCKBZBM2zXz
 nCbv41Bz2Z8niocvmdtrEa6IOgiO2KaAWJw1ucUqYprS491xQpyh8lsZAwAgTAqY+8Tk
 cJNu7Q4bDxBdxhFdHG1VQqhObmhj4kkc8TevozPF40rJCQaCdcpMHyehJpfZ/O5tl2Xj
 8jFlc4fOt1S40sdOMVQ0UDgFoGqlT7aMJkRG70EOtVCWJROAAMGjK7vIqy/Durd0BEVZ
 6+qg==
X-Gm-Message-State: AOAM530RoGth+uYXrh2ymsXlqSe46Tu0g2wT8a+ApCbZvQTep2pBHflo
 4qIEEdmJVaHINwaTULQNttBxVeqBrhULe37LRqHVzA==
X-Google-Smtp-Source: ABdhPJzrcPX+XvnEr9o4ngcrGjQ43RAfdERwldzGMmHX4xeYMuNF5bS5th9q9QzloR0WjqVd7cDYnGv8A04TKGgllmw=
X-Received: by 2002:a2e:b803:: with SMTP id u3mr54630896ljo.503.1641724254305; 
 Sun, 09 Jan 2022 02:30:54 -0800 (PST)
MIME-Version: 1.0
From: Kito Cheng <kito.cheng@sifive.com>
Date: Sun, 9 Jan 2022 18:30:43 +0800
Message-ID: <CALLt3TjtVFjTfszjM38sOX81KJ9TgdMLDBMfggJf9hveRgs3YQ@mail.gmail.com>
Subject: Public review for RISC-V psABI v1.0-rc1
To: Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_023057_316573_8ED3F150 
X-CRM114-Status: UNSURE (   5.11  )
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

SGkgYWxsOgoKSXTigJlzIEtpdG8gQ2hlbmcgZnJvbSB0aGUgUklTQy1WIGNvbW11bml0eSwgSmVz
c2ljYSBDbGFya2UgYW5kIEkgYXJlCndvcmtpbmcgb24gcmVsZWFzaW5nIGEgc3RhYmxlIHZlcnNp
b24gb2YgdGhlIHBzQUJJLCBhbmQgYXJlIHNlZWtpbmcKZmVlZGJhY2sgZnJvbSB0aGUgb3BlbiBz
b3VyY2UgY29tbXVuaXR5LgoKVGhlIGdvYWwgb2YgdGhpcyBzdGFibGUgcmVsZWFzZSBpcyBoYXZp
bmcgYSBzdGFibGUgdmVyc2lvbiB0byBsZXQKcGVvcGxlIHVzZSBhcyBhIHJlZmVyZW5jZSBwb2lu
dC4gV2UgYXJlIHRyeWluZyB0byBkZXNjcmliZSB3aGF0IHdlIGRpZAphbmQgd2hhdCB3ZSBoYXZl
LCBhbmQgd2l0aCBhcyBsaXR0bGUgbmV3IHN0dWZmIGFzIG5lY2Vzc2FyeSBmb3IgdGhlCm5ldyBh
bmQgdXBjb21pbmcgZXh0ZW5zaW9ucy4KCkJ1dCB0aGF0IGRvZXMgTk9UIG1lYW4gd2Ugd29u4oCZ
dCBhY2NlcHQgYW55IG5ldyBzdHVmZiBpbiB0aGUgZnV0dXJlLAp0aGUgUklTQy1WIHBzQUJJIHdp
bGwgc3RpbGwgYWNjZXB0IG5ldyBiYWNrd2FyZHMtY29tcGF0aWJsZSBjaGFuZ2VzCmFuZCByZWxl
YXNlIHBlcmlvZGljYWxseSBnb2luZyBmb3J3YXJkcy4KCkZlZWwgZnJlZSB0byBnaXZlIGZlZWRi
YWNrIG9yIGFzayBhbnkgcXVlc3Rpb24gYnkgcmVwbHlpbmcgdG8gdGhpcwptYWlsIG9yIGNyZWF0
aW5nIGFuIGlzc3VlIG9uIEdpdEh1YiEKCkRvY3VtZW50OiBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1lbGYtcHNhYmktZG9jL3JlbGVhc2VzL3RhZy92MS4wLXJjMQpDcmVh
dGUgaXNzdWVzIGhlcmU6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWVs
Zi1wc2FiaS1kb2MvaXNzdWVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==

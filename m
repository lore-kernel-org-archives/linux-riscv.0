Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE769C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bbolKO7oF3u946qQfrtQuEHdMuru/5sjougkOidBtYM=; b=arM2QlF6AR9GxR
	BV0GSm7EQOXyr8ywb71BiCoUQ2UDQXaB7gw5XOV69isp3SqZl5WTM//4uTp/b3yOhdkiltmz/9f6O
	IffirJBXGCZgv1lF3uDlcwmuLd52t0lsIX2njjk2WIzKFBXIBUivQKqYz9vdRLHqZ6QgAUa3k5vGu
	tnOn+pqHa+LqA1m/FGoTrdy5JuH7b/tfl1cvPD61Mk5TFkTE5XVU/2dde4OciXJRtzZcR+9NOjEgY
	FI+4V3Rva1ZgayHUNo14wu5KnMgoju3h/WCs+qBN9zDLU4sDfEfIErdEDqHRnuWntt940TuwZTvw0
	XBdU5AHce0IP4kqqrDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2r7-000000013gt-2t8U;
	Thu, 08 May 2025 15:08:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Ht-00000000vvS-3y22
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 14:31:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso513305e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746714708; x=1747319508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J289PIBzAx7Tr0WnqlsEi/cyRMc03tLDH2ivRhYAjbA=;
        b=MYppVC4ppwDRY09HVPTMp7Smd80w9dzMLmQa8QVQZrlccFv3AYmPLiAZCu8bQZlzJ3
         7ykwlIEYvgN8uq0bk5DGFRlzFFRxwLnzaAruoEygBuhdcfbT1/awTtxLPhglDE2nevcn
         nupHBRcptmdHQCmJiMUR2kL80f9FKhqIOi812BwjUVtuT5F5xW9UAZrRm2CZ2mJxV16T
         2GqihH1jLixXKwKTSooEMrvtCeph1U1nskrDC/lYI8R0wuA4BSeK5V6ksHykq2CsYm/X
         8izikt4VHjceqtt9DanWHx9ADkLbMmJk01CNHGl6xDW6Wrz8bkM6Fw5JemLiee6nO2Ip
         gvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714708; x=1747319508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J289PIBzAx7Tr0WnqlsEi/cyRMc03tLDH2ivRhYAjbA=;
        b=cUsKO9J3BAlasaX9oBZZR1YAZqv8pQHgCt4qvGJ4gKJFJrbMCxYbHwRm5yY8aAcEJR
         NapNMzfQ8MidEg5EsseU9ar8nwLt9O0Npn13MoawXcTPdHdFcOcL6dOYkmpimTwL0jM+
         xEJ6CFj/i0I/knthAO8mmTehLNIQQ22DAqXa87dFxaQVa/Qq0+SqTOyUaFDu+re6sH1R
         HmQyOyd9bE7lZogbcHZssgmGXYtNNyjU5UhLJ5DX+THccVgDd2Yfilb1BiVWmD7vesnA
         TGM6lCMb/rNt4kCBoiCeIJELpXGR80nZUvlc++R4fuQ3x1Ks1Lopomtvatut82QQdicO
         FWwA==
X-Forwarded-Encrypted: i=1; AJvYcCXJoayXjwf2xGh8O/owFsuurFkjv1mzWzP8oDLq8aJCMSnQ+rvYLWklsuCKLGJEDUu6rJL85g1ty1469Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFQZMob99I/i+BUTdqEnRqvLTs9/T9GGWlRHeeNSqiQEWebG7
	PMakIgXq9EXRBmF3/WjaPQ9YpDdsz8XF01oMenAStKYB4rC/DZtw/LMWJZjktKqXTRy/zx1KWJW
	1
X-Gm-Gg: ASbGncvElqbIhVeu4yxWronD0W2LpbS9J2KkmoYO113DeV3QBsyDeJBRzGQUo7nWJzu
	Ld2sw/gS9kBLrG84TzTAXICMM6z6qHcnAzgoZ+OE5uewdPiV/y0pgukaDOSBLtGfi9KcVT9joyN
	5IHtbfGKGGvYfmvgOF4dOjfNwUFjC+/pUxxMTrzGJzQ1cFNoaWwJib5d89A6sawudAU3KpWKGQ/
	fdLUF/h2uycikj8k7bmF0hKWfUN2mxzfjWSavNOFlcVWth2XgBC7z5c8LB84EmgP0DA+Mmntxa6
	9V1RygXNzzLElNY1b7Qvcew3CcEFAG3NjQh61+deayiSyzri
X-Google-Smtp-Source: AGHT+IERiYDpBDm+YzS6PrcsAiPhkSZhHoyL95j9WWRBe54YT3aYnzBdh6Eog8U2+DIPfLiIAXgnoQ==
X-Received: by 2002:a05:600c:83ca:b0:441:c1ae:3340 with SMTP id 5b1f17b1804b1-441d44bcaabmr24998165e9.1.1746714708028;
        Thu, 08 May 2025 07:31:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm39844285e9.13.2025.05.08.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:31:47 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 0/2] VCPU reset fixes
Date: Thu,  8 May 2025 16:28:41 +0200
Message-ID: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_073149_987475_AE8C89C3 
X-CRM114-Status: GOOD (  15.23  )
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

SGVsbG8sCgp2MiBhYmFuZG9ucyB0aGUgaWRlYSBvZiBmaXhpbmcgY3VycmVudCB1c2Vyc3BhY2Vz
IGFuZCBhZGRzIGEgbmV3CmNhcGFiaWxpdHkgdGhhdCB1c2VzIE1QX1NUQVRFIHRvIGltbWVkaWF0
ZWx5IHRyaWdnZXIgYSBLVk0gVkNQVSByZXNldCAtLQphIHNpbmdsZS1wdXJwb3NlIGludGVyZmFj
ZSBmcmVlIG9mIGFueSB1bmludGVuZGVkIHNpZGUgZWZmZWN0cyBpcwpkZXNpcmFibGUgYW5kIE1Q
X1NUQVRFIGlzIHNvbWV3aGF0IGJlbmRhYmxlLCB3aGljaCBhdm9pZHMgdGhlIG5lZWQgZm9yIGEK
bmV3IElPQ1RMLiAgSXQncyB2ZXJ5IGRpcnR5LCB0aG91Z2gsIHNvIEknbSBub3QgaGFwcHkgd2l0
aCBpdC4KCkkgaGF2ZSBwcmVwYXJlZCBhIHByZXZpZXcgUUVNVSBpbXBsZW1lbnRhdGlvbiBbMV0g
YW5kIG9ubHkgZGlkIGxpZ2h0CnRlc3Rpbmcgd2l0aCBrdm0tdW5pdC10ZXN0cyBhcyBJIHN0aWxs
IGV4cGVjdCBhIGhpZ2gtbGV2ZWwgZGlzY3Vzc2lvbi4KCkJlY2F1c2UgaXQgZGlkbid0IHRha2Ug
bXVjaCBlZmZvcnQgb24gdG9wLCB2MiBleHBhbmRzIHRoZSBnb2FscyAtLQp1c2Vyc3BhY2UgY2Fu
IG5vdyBjaG9vc2UgdGhlIHNhbWUgcG9zdC1yZXNldCBzdGF0ZSBmb3IgYWxsIFZDUFVzLgooVGhp
cyBpcyBhY2hpZXZlZCBieSByZXR1cm5pbmcgZnJvbSB1c2Vyc3BhY2Ugb24gc2JpX2hhcnRfc3Rv
cDsgbGV0IG1lCiBrbm93IGlmIEkgc2hvdWxkIHJhdGhlciBkbyB0aGF0IHdpdGggYW5vdGhlciBL
Vk0gY2FwYWJpbGl0eS4pCgpUaGlzIHNlcmllcyBkb2VzIG5vdCBmdWxseSBhZGRyZXNzIHRoZSBW
Q1BVIGhvdC11bnBsdWcuCldlIHN0aWxsIG5lZWQgYSBiZXR0ZXIgS1ZNIGludGVyZmFjZSB0aGVy
ZSwgYmVjYXVzZSB0aGUgVkNQVSBzdG9wcGVkIGJ5CnNiaV9oYXJ0X3N0b3AgaXMgc3RpbGwgYXNz
dW1lZCB0byBiZSBwcmVzZW50IGJ5IHNiaV9oYXJ0X3N0YXJ0LgoKSSBzZWUgcm91Z2hseSB0d28g
b3B0aW9ucywgd2l0aCBkaWZmZXJlbnQgZHJhd2JhY2tzOgoqIGFkZCBhIG5ldyBNUF9TVEFURSBm
b3IgdGhlIFNCSSBIU00gYWNjZWxlcmF0aW9uIGluIEtWTQoqIHJldHVybiB0byB1c2Vyc3BhY2Ug
ZXZlbiBvbiBzYmlfaGFydF9zdGFydCBhbmQgc2JpX2hhcnRfZ2V0X3N0YXR1cwoKKFdlIG1pZ2h0
IHdhbnQgdG8gaGF2ZSBhIGJldHRlciBpbnRlcmZhY2UgZm9yIGhhbmRpbmcgU0JJIGluIHVzZXJz
cGFjZQogYW55d2F5LCBzbyB0aGF0IGNvdWxkIGJlIGhhbmRsZWQgbGF0ZXIuKQoKdjIgaXMgYmFz
ZWQgb24ga3ZtLXJpc2N2L3Jpc2N2X2t2bV9xdWV1ZSwgMzc2ZTNjMGY4YWE1ICgiS1ZNOiBSSVND
LVY6CnJlbW92ZSB1bm5lY2Vzc2FyeSBTQkkgcmVzZXQgc3RhdGUiKS4KCk1vc3Qgb2YgdGhlIHBh
dGNoZXMgZnJvbSB2MSBnb3QgbWVyZ2VkLCB0aGFua3MgQW51cCwgc28gdjIgb25seSBjb250YWlu
cwp0aGUgY29tcGxldGVseSByZWRlc2lnbmVkIGFwcHJvYWNoIFsyLzJdIGFuZCBhIG1pbm9yIGNv
ZGUgc3R5bGUKaW1wcm92ZW1lbnQgdGhhdCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcyB3aGVuIHRo
ZSBwYXRjaGVzIGdvdCBtZXJnZWQgb3V0Cm9mIG9yZGVyIFsxLzJdLgoKLS0tCjE6IGh0dHBzOi8v
Z2l0aHViLmNvbS9xZW11L3FlbXUvY29tbWl0L2RlYzA0Mjg0MWYzODNjNmE4MjViMTY0MmI4NmQ5
ZjU4NTc3OGEyZTcKClJhZGltIEtyxI1tw6HFmSAoMik6CiAgS1ZNOiBSSVNDLVY6IHJlc2V0IHNt
c3RhdGVlbiBpbiBhIGJldHRlciBwbGFjZQogIFJJU0MtVjogS1ZNOiBhZGQgS1ZNX0NBUF9SSVND
Vl9NUF9TVEFURV9SRVNFVAoKIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAg
fCAxNSArKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICB8
ICAzICsrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICAxICsKIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCAxNyAr
KysrKysrKysrKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jICAgICAgICAgfCAgNyAr
KysrLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgICAgICB8ICAzICsrLQogYXJj
aC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKwogaW5jbHVk
ZS91YXBpL2xpbnV4L2t2bS5oICAgICAgICAgICAgICB8ICAxICsKIDkgZmlsZXMgY2hhbmdlZCwg
ODIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgotLSAKMi40OS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

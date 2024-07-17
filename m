Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87A6C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1FTeEKd6FQFa9wGnRJBs8tNM+7Ad8K683OwDtULck8Y=; b=No2CiHSRMuDtsi
	BQLUI2j+rJ86vWYidlkeFumyZRUshW8jWaIBDL+p1Nzg2eZNxMboPgsK/cMk9CfJ7iBkQzqzUWuSi
	HJGvOyl5eHplRT3GynjbywRwXsmjaelhH4Vw7vItrcUo9EHwMBYr6iK6tUY2RXpKq5b8dm1sNIN1i
	59xiNi7xgMoOXgRa8APoRQ7t5Bats9iJClA9TPo7al2dHlJiix4jJpf4kdELmt71nYcO3yAJxv8OU
	v71ygZPXR54LKhOfFbo2qcsKx85akn4edqqhzoX0BoR4EqyoLziy8jQmn7OC8eUIB0GGfO/9d+t0A
	M4vCyyHqxhWm9XuENTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxjQ-0000000Ckxi-3RlF;
	Wed, 17 Jul 2024 06:01:40 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxjM-0000000CkwF-2IFq
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:01:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52ea952ce70so6758166e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721196094; x=1721800894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl3L0FVYFNGhFKHk1JJU6PwaolSCChVISQJkZ5aIzzI=;
        b=XHdhECRuZb/3z2ELukQWaQYbPah8GRbxS1MB03x0dy3NVuSvZ9WAJGGyYIg6lK3OJs
         0KMRZdsQcW/tKD6P/cp0kv0OFy7D7Roin13B5BBKM2XV9vhPur/HH+BwBozPIT7hTHn0
         VP6sYZNjV0setvYDcVzBe1IKomVtrsSxD3qEb+zQn1pzBSZ0xnPrbObNXjuQttBoO4ha
         PMlGY8X0/wjV/+6683RlWYdFEsvGBBz5wm/lwhPfW6CrhgmeA3N1Xa43D0+NZq5nJujy
         Ng/sI3urTX0xGUAJn1wUFi6gbyP4z1oRh7XTldA5zIo6VWPIbSm2qrbuvaDxHvBc/Thv
         799A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196094; x=1721800894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl3L0FVYFNGhFKHk1JJU6PwaolSCChVISQJkZ5aIzzI=;
        b=fzAse13e7+id4hw/av+zuNAhB5OT1ywl0hdnSWnEtqCl0o2NlGltPls143bFcwyLut
         nYGJPMlkeZCZMKXuDU6eG66fPYBV1qPPfwQ2aB8WCVdNQIYrQ9khh2kS+JVyzjV4hCdT
         0tohDRQLAN6MlCfKM1fR/wUXpGITC1sBUTrMAKyvRO3XlZUedmgGCiDcNWfxabQ9kpDo
         hROlCR5QEUrhA+CxZdwNqULyXtziZm1FjBMqArnSEFlfEUMxAifYJTgd3FsWWZeLIR5m
         9SvKPdCfZZ+bQVUuxdRe/AU5Mvlh4Af2wc1IrWIVCMUiV7CKcU+8phq3SuA9KkXAB+q7
         nyiw==
X-Forwarded-Encrypted: i=1; AJvYcCWXVdBA5ekqizJmA++QxIE8Y+lZmLGg6KNTOopB7U+1tCN5jzfQuLwHLyi2uMDasA9RjFyQkL3uyjKYGGWMTTqGt/b9xO1XM/eRgATYgXem
X-Gm-Message-State: AOJu0YwjxOQWvDTJPIePRLJGDWikWvYszwJEzL7ALEvgxj99zUZf1w2k
	RtFsxl7sfIYXDcMWlJcGkghPXrvoNLU4cxjLxI4U7gIedVDX1GgXL+4oym77ve0=
X-Google-Smtp-Source: AGHT+IGTWlMHonD8VGH1O7WD0Yggp5hmzzpiSRuP4gthch3y8dFycbjmh4esQgOV2+4OGbeLMAp6Ag==
X-Received: by 2002:a05:6512:b82:b0:52e:bdd4:610b with SMTP id 2adb3069b0e04-52ee53a573fmr514590e87.4.1721196093903;
        Tue, 16 Jul 2024 23:01:33 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23a000sm193895315e9.5.2024.07.16.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:01:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 0/4] Svvptc extension to remove preventive sfence.vma
Date: Wed, 17 Jul 2024 08:01:21 +0200
Message-Id: <20240717060125.139416-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_230136_873957_614EB2FC 
X-CRM114-Status: GOOD (  18.32  )
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

SW4gUklTQy1WLCBhZnRlciBhIG5ldyBtYXBwaW5nIGlzIGVzdGFibGlzaGVkLCBhIHNmZW5jZS52
bWEgbmVlZHMgdG8gYmUKZW1pdHRlZCBmb3IgZGlmZmVyZW50IHJlYXNvbnM6CgotIGlmIHRoZSB1
YXJjaCBjYWNoZXMgaW52YWxpZCBlbnRyaWVzLCB3ZSBuZWVkIHRvIGludmFsaWRhdGUgaXQgb3Ro
ZXJ3aXNlCiAgd2Ugd291bGQgdHJhcCBvbiB0aGlzIGludmFsaWQgZW50cnksCi0gaWYgdGhlIHVh
cmNoIGRvZXMgbm90IGNhY2hlIGludmFsaWQgZW50cmllcywgYSByZW9yZGVyZWQgYWNjZXNzIGNv
dWxkIGZhaWwKICB0byBzZWUgdGhlIG5ldyBtYXBwaW5nIGFuZCB0aGVuIHRyYXAgKHNmZW5jZS52
bWEgYWN0cyBhcyBhIGZlbmNlKS4KCldlIGNhbiBhY3R1YWxseSBhdm9pZCBlbWl0dGluZyB0aG9z
ZSAobW9zdGx5KSB1c2VsZXNzIGFuZCBjb3N0bHkgc2ZlbmNlLnZtYQpieSBoYW5kbGluZyB0aGUg
dHJhcHMgaW5zdGVhZDoKCi0gZm9yIG5ldyBrZXJuZWwgbWFwcGluZ3M6IG9ubHkgdm1hbGxvYyBt
YXBwaW5ncyBuZWVkIHRvIGJlIHRha2VuIGNhcmUgb2YsCiAgb3RoZXIgbmV3IG1hcHBpbmcgYXJl
IHJhcmUgYW5kIGFscmVhZHkgZW1pdCB0aGUgcmVxdWlyZWQgc2ZlbmNlLnZtYSBpZgogIG5lZWRl
ZC4KICBUaGF0IG11c3QgYmUgYWNoaWV2ZWQgdmVyeSBlYXJseSBpbiB0aGUgZXhjZXB0aW9uIHBh
dGggYXMgZXhwbGFpbmVkIGluCiAgcGF0Y2ggMywgYW5kIHRoaXMgYWxzbyBmaXhlcyBvdXIgZnJh
Z2lsZSB3YXkgb2YgZGVhbGluZyB3aXRoIHZtYWxsb2MgZmF1bHRzLgoKLSBmb3IgbmV3IHVzZXIg
bWFwcGluZ3M6IFN2dnB0YyBtYWtlcyB1cGRhdGVfbW11X2NhY2hlKCkgYSBuby1vcCBidXQgd2Ug
Y2FuCiAgdGFrZSBzb21lIGdyYXR1aXRvdXMgcGFnZSBmYXVsdHMgKHdoaWNoIGFyZSB2ZXJ5IHVu
bGlrZWx5IHRob3VnaCkuCgpQYXRjaCAxIGFuZCAyIGludHJvZHVjZSBTdnZwdGMgZXh0ZW5zaW9u
IHByb2JpbmcuCgpPbiBvdXIgdWFyY2ggdGhhdCBkb2VzIG5vdCBjYWNoZSBpbnZhbGlkIGVudHJp
ZXMgYW5kIGEgNi41IGtlcm5lbCwgdGhlCmdhaW5zIGFyZSBtZWFzdXJhYmxlOgoKKiBLZXJuZWwg
Ym9vdDogICAgICAgICAgICAgICAgICA2JQoqIGx0cCAtIG1tYXBzdHJlc3MwMTogICAgICAgICAg
IDglCiogbG1iZW5jaCAtIGxhdF9wYWdlZmF1bHQ6ICAgICAgMjAlCiogbG1iZW5jaCAtIGxhdF9t
bWFwOiAgICAgICAgICAgNSUKCkhlcmUgYXJlIHRoZSBjb3JyZXNwb25kaW5nIG51bWJlcnMgb2Yg
c2ZlbmNlLnZtYSBlbWl0dGVkOgoKKiBVYnVudHUgYm9vdCB0byBsb2dpbjoKQmVmb3JlOiB+NjMw
ayBzZmVuY2Uudm1hCkFmdGVyOiAgfjIwMGsgc2ZlbmNlLnZtYQoKKiBsdHAgLSBtbWFwc3RyZXNz
MDEKQmVmb3JlOiB+NDVrCkFmdGVyOiAgfjYuM2sKCiogbG1iZW5jaCAtIGxhdF9wYWdlZmF1bHQK
QmVmb3JlOiB+NjY1awpBZnRlcjogICA4MzIgKCEpCgoqIGxtYmVuY2ggLSBsYXRfbW1hcApCZWZv
cmU6IH41NDZrCkFmdGVyOiAgIDcxOCAoISkKClRoYW5rcyB0byBWZWQgYW5kIE1hdHQgRXZhbnMg
Zm9yIHRyaWdnZXJpbmcgdGhlIGRpc2N1c3Npb24gdGhhdCBsZWQgdG8KdGhpcyBwYXRjaHNldCEK
CkFueSBmZWVkYmFjaywgdGVzdCBvciByZWxldmFudCBiZW5jaG1hcmsgYXJlIHdlbGNvbWUg8J+Z
ggoKdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNzAyMDg1MDM0
LjQ4Mzk1LTEtYWxleGdoaXRpQHJpdm9zaW5jLmNvbS8KdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjQwMTMxMTU1OTI5LjE2OTk2MS0xLWFsZXhnaGl0aUByaXZvc2lu
Yy5jb20vCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMTIwNzE1
MDM0OC44MjA5Ni0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCgpDaGFuZ2VzIGluIHY0OgotIEZp
eCBydjMyIChBbnVwKQotIEZpeCBhbW9zd2FwLncgdXNpbmcgYW1vc3dhcC5kIChBbnVwKQotIFNh
dmUgb25seSBuZWVkZWQgcmVnaXN0ZXJzIChZdW5odWkpCi0gRml4IGJ1aWxkIGlzc3VlIG9uIGxs
dm0gYnkgYWRkaW5nIGEgOyBhZnRlciBhIGxhYmVsIChrZXJuZWwgdGVzdCByb2JvdCkKCkNoYW5n
ZXMgaW4gdjM6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjEwCi0gUmVtb3ZlIHRoZSBjb21tZW50IGFi
b3V0IHhSRVQgYWN0aW5nIGFzIGEgZmVuY2Ugd2hpY2ggaXMgbm90IHBhcnQgb2YKICB0aGUgcmF0
aWZpZWQgc3BlY2lmaWNhdGlvbgotIEFkZCAjc2ZlbmNlLnZtYSB0byB0aGUgY292ZXIgbGV0dGVy
IChBbmRyZWEpCi0gUmVtb3ZlIHRoZSBSRkMgYXMgc3Z2cHRjIHdhcyByYXRpZmllZCB0aGUgMjh0
aCBvZiBKdW5lIDIwMjQKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjgtcmMx
Ci0gUmVtb3ZlIHBhdGNoIHdpdGggcnVudGltZSBkZXRlY3Rpb24gb2YgdGxiIGNhY2hpbmcgYW5k
IGRlYnVnZnMgcGF0Y2gKLSBBZGQgcGF0Y2ggdGhhdCBwcm9iZXMgU3Z2cHRjCi0gQWRkIHBhdGNo
IHRoYXQgZGVmaW5lcyB0aGUgbmV3IFN2dnB0YyBkdC1iaW5kaW5nCi0gTGVhdmUgdGhlIGJlaGF2
aW91ciBhcy1pcyBmb3IgdWFyY2hzIHRoYXQgY2FjaGUgaW52YWxpZCBUTEIgZW50cmllcyBzaW5j
ZQogIEkgZG9uJ3QgaGF2ZSBhbnkgZ29vZCBwZXJmIG51bWJlcnMKLSBBZGRyZXNzIGNvbW1lbnRz
IGZyb20gQ2hyaXN0b3BoIG9uIHYxCi0gRml4IGEgcmFjZSBjb25kaXRpb24gaW4gbmV3X3ZtYWxs
b2MgdXBkYXRlOgoKICAgICAgIGxkICAgICAgYTIsIDAoYTApIDw9IHRoaXMgY291bGQgbG9hZCBz
b21ldGhpbmcgd2hpY2ggaXMgIT0gLTEKICAgICAgIG5vdCAgICAgYTEsIGExICAgIDw9IGhlcmUg
b3IgaW4gdGhlIGluc3RydWN0aW9uIGFmdGVyLCBmbHVzaF9jYWNoZV92bWFwKCkKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvdWxkIG1ha2UgdGhlIHdob2xlIGJpdG1hcCB0byAxCiAgICAg
ICBhbmQgICAgIGExLCBhMiwgYTEKICAgICAgIHNkICAgICAgYTEsIDAoYTApIDw9IGhlcmUgd2Ug
d291bGQgY2xlYXIgYml0cyB0aGF0IHNob3VsZCBub3QgYmUgY2xlYXJlZCEKCiAgIEluc3RlYWQs
IHJlcGxhY2UgdGhlIHdob2xlIHNlcXVlbmNlIHdpdGg6CiAgICAgICBhbW94b3IudyAgICAgICAg
YTAsIGExLCAoYTApCgpBbGV4YW5kcmUgR2hpdGkgKDQpOgogIHJpc2N2OiBBZGQgSVNBIGV4dGVu
c2lvbiBwYXJzaW5nIGZvciBTdnZwdGMKICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBTdnZwdGMg
SVNBIGV4dGVuc2lvbiBkZXNjcmlwdGlvbgogIHJpc2N2OiBTdG9wIGVtaXR0aW5nIHByZXZlbnRp
dmUgc2ZlbmNlLnZtYSBmb3IgbmV3IHZtYWxsb2MgbWFwcGluZ3MKICByaXNjdjogU3RvcCBlbWl0
dGluZyBwcmV2ZW50aXZlIHNmZW5jZS52bWEgZm9yIG5ldyB1c2Vyc3BhY2UgbWFwcGluZ3MKICAg
IHdpdGggU3Z2cHRjCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sIHwgIDcgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oICAgICAgICAg
ICB8IDE4ICsrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAg
ICB8ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgICB8
IDE2ICsrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCAgICAgICAgICB8
ICA3ICsrCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jICAgICAgICAgICAgICAgfCAg
NyArKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgIDEg
KwogYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgICAgICAgIHwgODcgKysr
KysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTMgKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCAxNTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==

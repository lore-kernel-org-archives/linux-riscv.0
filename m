Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595AAC10F16
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 20:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wk/SDNtnqAguhSbD7YPGKNM7sXIN54EHTSQSwTQzek4=; b=U1XJ9x4KcX1wsd
	rmymC7x4/q8GBlCugoB3sEo+a7EYAOBBfM6PxPnzNhBrEsslVpxbaafp1WXAc7LzUK4oeGzVgewn8
	OKaD8RX13LIYvRU4alBBruPrq4Ghc/N6XDJNASG68QAZLniNDHU3MvBQr4hzW5o7pHlnwvh5SeLoM
	V817Mnq7HNaoeR4wBXbjxP0+cZED8vQhm7wBnYtxMer5Lo8H/ypO4bQD61YfHqaeDKo7xk9kXjeIB
	/wad+XF9D/NW72xJjLu5Cc0k/fsh1Yd3XZ5gl6NT0PQdN9CgBKG34cEwyLaiPbydTQwsstdlYutrv
	j+h2eAHVPpGbFRP2MyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgc-00000007n2g-41mY;
	Tue, 30 Apr 2024 20:02:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgY-00000007n0o-1ZEM
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 20:02:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e51398cc4eso54659445ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 13:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714507358; x=1715112158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4LJjm/pyF2zhjcSW6gvyrQ1WLiqOQO+GuJphiWriDpw=;
        b=PywLmfX0Qa8g+YdPOWuePwLg3sMr9L/yyiIaYXsFHJ6KRwTuPcuTEFEnRrL8+0gByg
         DnMeIuRBg8w6L5XI2m5bG79D/S5nJd41xmdej+9arExTTGToXEzmW3ToJ781KcHLdmTV
         5EdXwaxsrH1E9efLcPV/rc1rI3x+qhkokDHQx9oyJ+tJb6ru/fH7FnI2s4IOBoEsHaVt
         oMDpRlMc6z2o/vqAGKnWwnVDKEpDLh2as9z+QcHCLAuNFMf5d361mIIsKqJbW4JlKrCo
         QapdhVvfz11m7AED5yGKxq+WhfKvF7h/XZCzoqgZqAF+fGtFhLMcCAdZbJlLnWZCctJS
         JzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714507358; x=1715112158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LJjm/pyF2zhjcSW6gvyrQ1WLiqOQO+GuJphiWriDpw=;
        b=vhzWw6MxWlt9IZ8jsgKSQ/J8LqE/MQ+u9NmP+4JWNPA51TQH9qo9f1blJB5gX4Yzbe
         lYol5cCQgDmxgN/gXx3gBgs+nvMwnj+SgEDw33rmTf5aB6Bpr+XjqP1VNAm+BMKCIioj
         sGvAtDFnCMPaEGwU7BC9AnKNysi7aSkXnWK1QVbKDZE41VOUd9U3vJRnYM7vMbf0Ge21
         S5winiySsf1WuU66pFefkIDSuGbwrvxqNQJMitdhLwkyAdcZf6QnEqWo2i1Ph9UPnPE4
         OXCNh+jF1QVPoc4yhw67dGNXKIXmNH0zsnYmxv8fsobthvymhZUbHRbAO0RFutFR0iwA
         loMw==
X-Forwarded-Encrypted: i=1; AJvYcCVf+u/7NzspUx+NUVhYPAsF+lCDizXUrASPR7ZMvLVhPngPQeY7109UitHQvhGXtWTNcJwupgTG8+TspYRPdljbDlm3todaw+zeDW//EEcC
X-Gm-Message-State: AOJu0YyTY1bvG1yuYBC6b2FqVTzR4rtWSCLcsnNMHT4MzcJRgUX2VA5c
	pAQd4PziRtCIbxlOf1IyC6EOl9sycAC2S3vGUfXPlNX9lurMrPDOi4xXHoNGeB0=
X-Google-Smtp-Source: AGHT+IGJcxkSCDzhcED+yMnX8Jj7+cRN1MgU3WMk1uF7uem/IatFkUZ3shWdYdvdr5tHyr9TaD2REw==
X-Received: by 2002:a17:902:da8e:b0:1eb:e5c0:6459 with SMTP id j14-20020a170902da8e00b001ebe5c06459mr534811plx.8.1714507358141;
        Tue, 30 Apr 2024 13:02:38 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001e435fa2521sm22809820pll.249.2024.04.30.13.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:02:37 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 0/7] Linux RISC-V IOMMU Support
Date: Tue, 30 Apr 2024 13:01:50 -0700
Message-Id: <cover.1714494653.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_130242_567803_BD8F9ABB 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBSSVNDLVYgSU9NTVUgYXJj
aGl0ZWN0ZWQKaGFyZHdhcmUgaW50byB0aGUgTGludXgga2VybmVsLgoKVGhlIFJJU0MtViBJT01N
VSBzcGVjaWZpY2F0aW9uLCB3aGljaCB0aGlzIHNlcmllcyBpcyBiYXNlZCBvbiwgaXMKcmF0aWZp
ZWQgYW5kIGF2YWlsYWJsZSBhdCBHaXRIdWIvcmlzY3Ytbm9uLWlzYSBbMV0uCgpBdCBhIGhpZ2gg
bGV2ZWwsIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiBkZWZpbmVzOgoKMSkgRGF0YSBz
dHJ1Y3R1cmVzOgogIC0gRGV2aWNlLWNvbnRleHQ6IEFzc29jaWF0ZXMgZGV2aWNlcyB3aXRoIGFk
ZHJlc3Mgc3BhY2VzIGFuZCBob2xkcwogICAgcGVyLWRldmljZSBwYXJhbWV0ZXJzIGZvciBhZGRy
ZXNzIHRyYW5zbGF0aW9ucy4KICAtIFByb2Nlc3MtY29udGV4dHM6IEFzc29jaWF0ZXMgZGlmZmVy
ZW50IHZpcnR1YWwgYWRkcmVzcyBzcGFjZXMgYmFzZWQKICAgIG9uIGRldmljZS1wcm92aWRlZCBw
cm9jZXNzIGlkZW50aWZpY2F0aW9uIG51bWJlcnMuCiAgLSBNU0kgcGFnZSB0YWJsZSBjb25maWd1
cmF0aW9uIHVzZWQgdG8gZGlyZWN0IGFuIE1TSSB0byBhIGd1ZXN0CiAgICBpbnRlcnJ1cHQgZmls
ZSBpbiBhbiBJTVNJQy4KMikgSW4tbWVtb3J5IHF1ZXVlIGludGVyZmFjZToKICAtIENvbW1hbmQt
cXVldWUgZm9yIGlzc3VpbmcgY29tbWFuZHMgdG8gdGhlIElPTU1VLgogIC0gRmF1bHQvZXZlbnQg
cXVldWUgZm9yIHJlcG9ydGluZyBmYXVsdHMgYW5kIGV2ZW50cy4KICAtIFBhZ2UtcmVxdWVzdCBx
dWV1ZSBmb3IgcmVwb3J0aW5nICJQYWdlIFJlcXVlc3QiIG1lc3NhZ2VzIHJlY2VpdmVkCiAgICBm
cm9tIFBDSWUgZGV2aWNlcy4KICAtIE1lc3NhZ2Utc2lnbmFsZWQgYW5kIHdpcmUtc2lnbmFsZWQg
aW50ZXJydXB0IG1lY2hhbmlzbXMuCjMpIE1lbW9yeS1tYXBwZWQgcHJvZ3JhbW1pbmcgaW50ZXJm
YWNlOgogIC0gTWFuZGF0b3J5IGFuZCBvcHRpb25hbCByZWdpc3RlciBsYXlvdXQgYW5kIGRlc2Ny
aXB0aW9uLgogIC0gU29mdHdhcmUgZ3VpZGVsaW5lcyBmb3IgZGV2aWNlIGluaXRpYWxpemF0aW9u
IGFuZCBjYXBhYmlsaXRpZXMgZGlzY292ZXJ5LgoKClRoaXMgc2VyaWVzIGludHJvZHVjZXMgUklT
Qy1WIElPTU1VIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGFuZCBjb21wbGV0ZQpzaW5nbGUtc3Rh
Z2UgdHJhbnNsYXRpb24gd2l0aCBwYWdpbmcgZG9tYWluIHN1cHBvcnQuCgpUaGUgcGF0Y2hlcyBh
cmUgb3JnYW5pemVkIGFzIGZvbGxvd3M6CgpQYXRjaCAxOiBJbnRyb2R1Y2VzIG1pbmltYWwgcmVx
dWlyZWQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBkcml2ZXIuClBhdGNoIDI6IERlZmlu
ZXMgUklTQy1WIElPTU1VIGRhdGEgc3RydWN0dXJlcywgaGFyZHdhcmUgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlCiAgICAgICAgIHJlZ2lzdGVycyBsYXlvdXQsIGFuZCBtaW5pbWFsIGluaXRpYWxpemF0
aW9uIGNvZGUgZm9yIGVuYWJsaW5nIGdsb2JhbAogICAgICAgICBwYXNzLXRocm91Z2ggZm9yIGFs
bCBjb25uZWN0ZWQgbWFzdGVycy4KUGF0Y2ggMzogSW1wbGVtZW50cyB0aGUgZGV2aWNlIGRyaXZl
ciBmb3IgUENJZSBpbXBsZW1lbnRhdGlvbiBvZiBSSVNDLVYgSU9NTVUKICAgICAgICAgYXJjaGl0
ZWN0ZWQgaGFyZHdhcmUuClBhdGNoIDQ6IEludHJvZHVjZXMgSU9NTVUgaW50ZXJmYWNlcyB0byB0
aGUga2VybmVsIHN1YnN5c3RlbS4KUGF0Y2ggNTogSW1wbGVtZW50cyBkZXZpY2UgZGlyZWN0b3J5
IG1hbmFnZW1lbnQgd2l0aCBkaXNjb3Zlcnkgc2VxdWVuY2VzIGZvcgogICAgICAgICBJL08gbWFw
cGVkIG9yIGluLW1lbW9yeSBkZXZpY2UgZGlyZWN0b3J5IHRhYmxlIGxvY2F0aW9uLCBoYXJkd2Fy
ZQogICAgICAgICBjYXBhYmlsaXRpZXMgZGlzY292ZXJ5LCBhbmQgZGV2aWNlIHRvIGRvbWFpbiBh
dHRhY2ggaW1wbGVtZW50YXRpb24uClBhdGNoIDY6IEltcGxlbWVudHMgY29tbWFuZCBhbmQgZmF1
bHQgcXVldWUsIGFuZCBpbnRyb2R1Y2VzIGRpcmVjdG9yeSBjYWNoZQogICAgICAgICBpbnZhbGlk
YXRpb24gc2VxdWVuY2VzLgpQYXRjaCA3OiBJbXBsZW1lbnRzIHBhZ2luZyBkb21haW4sIHdpdGgg
cGFnZSB0YWJsZSB1c2luZyB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlCiAgICAgICAgIENQVeKAmXMg
TU1VLiBUaGlzIHBhdGNoIHNlcmllcyBlbmFibGVzIG9ubHkgNEsgbWFwcGluZ3M7IGNvbXBsZXRl
IHN1cHBvcnQKICAgICAgICAgZm9yIGxhcmdlIHBhZ2UgbWFwcGluZ3Mgd2lsbCBiZSBpbnRyb2R1
Y2VkIGluIGZvbGxvdy11cCBwYXRjaCBzZXJpZXMuCgpGb2xsb3ctdXAgcGF0Y2ggc2VyaWVzLCBw
cm92aWRpbmcgbGFyZ2UgcGFnZSBzdXBwb3J0IGFuZCB1cGRhdGVkIHdhbGsgY2FjaGUKbWFuYWdl
bWVudCBiYXNlZCBvbiB0aGUgcmV2aXNlZCBzcGVjaWZpY2F0aW9uLCBhbmQgY29tcGxldGUgQVRT
L1BSSS9TVkEgc3VwcG9ydCwKd2lsbCBiZSBwb3N0ZWQgdG8gR2l0SHViIFsyXS4KCkNoYW5nZXMg
ZnJvbSB2MjoKLSByZWJhc2Ugb24gdG9wIG9mIHY2LjktcmM2IGFuZCBhcHBsaWVkIHNlcmllcyBm
b3IgaW9tbXUtbmV4dDoKICBJT01NVSBtZW1vcnkgb2JzZXJ2YWJpbGl0eSwgdjYgWzNdCiAgaW9t
bXUsIGRtYS1tYXBwaW5nOiBTaW1wbGlmeSBhcmNoX3NldHVwX2RtYV9vcHMoKSwgdjQgWzRdCi0g
ZHQtYmluZGluZ3M6IGNvbXBhdGlibGUgc3RyaW5nCi0gS2NvbmZpZzogb3B0aW9uYWwgYnVpbHQt
aW4gZHJpdmVyOyByZW1vdmVkIG1vZHVsZSBpbmZvCi0ga2R1bXAgc3VwcG9ydCBhZGRlZCwgaW50
ZXJydXB0cyBhbmQgYmluZGluZyBmaXhlcywgcGNpbV8qCi0gdXNlIGlvbW11IGFsbG9jYXRpb24g
YWNjb3VudGluZyB3cmFwcGVycwotIHVzZSBuZXcgZG1hLW1hcHBpbmcgc2V0dXAsIHJlbW92ZWQg
cHJvYmVfZmluYWxpemUKLSByZWxlYXNlIGRvbWFpbiBhZGRlZCwgbWVtb3J5IGFsbG9jYXRpb25z
IG1vdmVkIHRvIGRvbWFpbiBhbGxvYwotIHVwZGF0ZWQgZG9tYWluIGF0dGFjaCBmbG93LCBmaXhl
cyBmb3IgZG9tYWluIHRvIGRldmljZSBib25kIGxvY2tpbmcKLSBmaXhlZCBhbGlnbm1lbnQgY2hl
Y2ssIGZpeGVkIG5vbi1sZWFmIHBhZ2UgcmVsZWFzZQotIGRyaXZlciB3YXJuaW5ncyBjbGVhbmVk
IHVwCgoKQmVzdCByZWdhcmRzLAogVG9tYXN6IEplem5hY2gKClsxXSBsaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1pb21tdQpbMl0gbGluazogaHR0cHM6Ly9naXRo
dWIuY29tL3RqZXpuYWNoL2xpbnV4ClszXSBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1pb21tdS8yMDI0MDQxMzAwMjUyMi4xMTAxMzE1LTEtcGFzaGEudGF0YXNoaW5Ac29sZWVu
LmNvbS8KWzRdIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11L2NvdmVy
LjE3MTM1MjMxNTIuZ2l0LnJvYmluLm11cnBoeUBhcm0uY29tLwp2MiBsaW5rOiAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcxMzQ1NjU5Ny5naXQudGplem5hY2hA
cml2b3NpbmMuY29tLwp2MSBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9t
bXUvY292ZXIuMTY4OTc5MjgyNS5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwoKVG9tYXN6IEpl
em5hY2ggKDcpOgogIGR0LWJpbmRpbmdzOiBpb21tdTogcmlzY3Y6IEFkZCBiaW5kaW5ncyBmb3Ig
UklTQy1WIElPTU1VCiAgaW9tbXUvcmlzY3Y6IEFkZCBSSVNDLVYgSU9NTVUgcGxhdGZvcm0gZGV2
aWNlIGRyaXZlcgogIGlvbW11L3Jpc2N2OiBBZGQgUklTQy1WIElPTU1VIFBDSWUgZGV2aWNlIGRy
aXZlcgogIGlvbW11L3Jpc2N2OiBFbmFibGUgSU9NTVUgcmVnaXN0cmF0aW9uIGFuZCBkZXZpY2Ug
cHJvYmUuCiAgaW9tbXUvcmlzY3Y6IERldmljZSBkaXJlY3RvcnkgbWFuYWdlbWVudC4KICBpb21t
dS9yaXNjdjogQ29tbWFuZCBhbmQgZmF1bHQgcXVldWUgc3VwcG9ydAogIGlvbW11L3Jpc2N2OiBQ
YWdpbmcgZG9tYWluIHN1cHBvcnQKCiAuLi4vYmluZGluZ3MvaW9tbXUvcmlzY3YsaW9tbXUueWFt
bCAgICAgICAgICAgfCAgMTUwICsrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICA4ICsKIGRyaXZlcnMvaW9tbXUvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVycy9pb21tdS9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAgMiArLQogZHJpdmVycy9pb21tdS9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgIHwgICAyMCArCiBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgfCAgICAzICsKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtYml0cy5oICAgICAg
ICAgICAgICB8ICA3ODIgKysrKysrKysrCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5j
ICAgICAgICAgICAgICAgfCAgMTE5ICsrCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRm
b3JtLmMgICAgICAgICAgfCAgIDkyICsKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICAg
ICAgICAgICAgICAgICB8IDE1NDkgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUuaCAgICAgICAgICAgICAgICAgICB8ICAgODggKwogMTEgZmlsZXMgY2hhbmdlZCwg
MjgxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNj
di9pb21tdS5oCgoKYmFzZS1jb21taXQ6IGU2NzU3MmNkMjIwNDg5NDE3OWQ4OWJkN2I5ODQwNzJm
MTkzMTNiMDMKbWVzc2FnZS1pZDogMjAyNDA0MTMwMDI1MjIuMTEwMTMxNS0xLXBhc2hhLnRhdGFz
aGluQHNvbGVlbi5jb20KbWVzc2FnZS1pZDogY292ZXIuMTcxMzUyMzE1Mi5naXQucm9iaW4ubXVy
cGh5QGFybS5jb20KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2A4C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B3m7YakZIXnia45VBQI5AEiTwExjGpCut4pXHSbsTeQ=; b=E9VeBIsbXwvtc2
	Chw6G6jeazMeb70fipmRM7v3s4lRL/y6+iTlH90hHsiowBBlqhAOSv0+xEy+wxbALNYr0XExJ2DmN
	v6aBYQWKZYKtliaf39RoaHRI8e9eXofyz1ioV8zrqhf0/ETu0sjCNtm9wnKTS/8dSybB3nMKilWdC
	gexHyQhzEQJbdYRe98t+5QJEVVZ10BQKhaKvBH2HVPC+mzTPvbFUDEkIHBMLKJdJMY0DQzb4n995C
	TtAk/ui4QB40i3bbr7hOByhst0wyEr1PYOjxWxZN4SJ9MCWSUEgY1klfNhR31DseBh9Us26obHxGp
	fpSpBCJhTuPkBW+JI0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwP-008h4I-00;
	Wed, 19 Jul 2023 19:34:29 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwL-008h2I-1R
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 19:34:27 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3a40b756eb0so27521b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689795264; x=1690400064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=898LnY9cJ7dwalJq3UYz/mDCfelRokl75v2pZe5QKSg=;
        b=tMmyEGaoPTP9a//tyRq8ynyPcoPNJdciVKPWijs/mHL/jvUK6t+mofl3RDIRUrqhHH
         6A/Bgjz2ykqJKTI4hg3/XFEN7w4lXR5J/KP1u8uT/YTr6Z+6jXCc0FUOD+0HnKbrdq0h
         j/v+Lliv5+aYmrGP/O3nneO/w19BZwcbfi2o8LKoDxmKmwcbs3q02CZjSMkjuIizzTqx
         kBe5/+rvpVf3k8KLJ8u+xQ6vhFwDqSNyCkQdHz33+jKYYJ53toPXjTQJUP638HtzYjtG
         /JWV9aAZdC4MEkhGhyqQfUsKtc8nGwEeNKSA5xeoRVY+a3ZhjczWtNCXH+tJRdEwAUq2
         u8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795264; x=1690400064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=898LnY9cJ7dwalJq3UYz/mDCfelRokl75v2pZe5QKSg=;
        b=BCy9eHKP7gFY9kwTAUZz2cPf/6jxa/VzEAB2hGbKIiVhl/0KSfSEuCndkDN3G3J+lE
         o+wadqPg33E/DpC0pkHZJj68+whyqCwRHDbYQON5idS6YPDbnCDe/LmXf5GWg5q6FBLZ
         KiRWBeWRGqCre1ztkj9FK+PmmdPtv56QYv/mWtgaReX49HsplpPLybei+hGZ/RN3PyUF
         UfuJ7lo3zPUysELnqhN+eR9LS4I/0dkMcHeom477bIv3udwzEoaQWW76DGgNhVJKOlws
         KiorvxQ3lXniiLlPIeZXGP+MkzPpg67FRlNVFabRCsoTpullq4cz8Oy5gcPd9z1sH8pi
         BUlg==
X-Gm-Message-State: ABy/qLbZw10jzmdRW4wPQnMk5CPF1XgUdrIXSGynLzitZ/pa8B8w/4VP
	WZYdrL01w+gdvjkefv/aBx09gg==
X-Google-Smtp-Source: APBJJlFS8kYmxrMQdI6vVbg8tjqWVgqnH6tvKbzas7Xx07kyU9Ed8nJU/Yakj0txh6GAxjHkYRUqBw==
X-Received: by 2002:a05:6808:19a5:b0:3a4:6cc2:893e with SMTP id bj37-20020a05680819a500b003a46cc2893emr488344oib.56.1689795263740;
        Wed, 19 Jul 2023 12:34:23 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b00264040322desm1591053pje.40.2023.07.19.12.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:34:23 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 00/13] Linux RISC-V IOMMU Support
Date: Wed, 19 Jul 2023 12:33:44 -0700
Message-Id: <cover.1689792825.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123425_726666_2A84DAD7 
X-CRM114-Status: GOOD (  16.50  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uIGlzIG5vdyByYXRpZmllZCBhcy1wZXIgdGhl
IFJJU0MtViBpbnRlcm5hdGlvbmFsCnByb2Nlc3MgWzFdLiBUaGUgbGF0ZXN0IGZyb3plbiBzcGVj
aWZjYXRpb24gY2FuIGJlIGZvdW5kIGF0OgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlz
YS9yaXNjdi1pb21tdS9yZWxlYXNlcy9kb3dubG9hZC92MS4wL3Jpc2N2LWlvbW11LnBkZgoKQXQg
YSBoaWdoLWxldmVsLCB0aGUgUklTQy1WIElPTU1VIHNwZWNpZmljYXRpb24gZGVmaW5lczoKMSkg
TWVtb3J5LW1hcHBlZCBwcm9ncmFtbWluZyBpbnRlcmZhY2UKICAgLSBNYW5kYXRvcnkgYW5kIG9w
dGlvbmFsIHJlZ2lzdGVycyBsYXlvdXQgYW5kIGRlc2NyaXB0aW9uLgogICAtIFNvZnR3YXJlIGd1
aWRlbGluZXMgZm9yIGRldmljZSBpbml0aWFsaXphdGlvbiBhbmQgY2FwYWJpbGl0aWVzIGRpc2Nv
dmVyeS4KMikgSW4tbWVtb3J5IHF1ZXVlIGludGVyZmFjZQogICAtIEEgY29tbWFuZC1xdWV1ZSB1
c2VkIGJ5IHNvZnR3YXJlIHRvIHF1ZXVlIGNvbW1hbmRzIHRvIHRoZSBJT01NVS4KICAgLSBBIGZh
dWx0L2V2ZW50IHF1ZXVlIHVzZWQgdG8gYnJpbmcgZmF1bHRzIGFuZCBldmVudHMgdG8gc29mdHdh
cmXigJlzIGF0dGVudGlvbi4KICAgLSBBIHBhZ2UtcmVxdWVzdCBxdWV1ZSB1c2VkIHRvIHJlcG9y
dCDigJxQYWdlIFJlcXVlc3TigJ0gbWVzc2FnZXMgcmVjZWl2ZWQgZnJvbQogICAgIFBDSWUgZGV2
aWNlcy4KICAgLSBNZXNzYWdlLXNpZ25hbGxlZCBhbmQgd2lyZS1zaWduYWxlZCBpbnRlcnJ1cHQg
bWVjaGFuaXNtLgozKSBJbi1tZW1vcnkgZGF0YSBzdHJ1Y3R1cmVzCiAgIC0gRGV2aWNlLWNvbnRl
eHQ6IHVzZWQgdG8gYXNzb2NpYXRlIGEgZGV2aWNlIHdpdGggYW4gYWRkcmVzcyBzcGFjZSBhbmQg
dG8gaG9sZAogICAgIG90aGVyIHBlci1kZXZpY2UgcGFyYW1ldGVycyB1c2VkIGJ5IHRoZSBJT01N
VSB0byBwZXJmb3JtIGFkZHJlc3MgdHJhbnNsYXRpb25zLgogICAtIFByb2Nlc3MtY29udGV4dHM6
IHVzZWQgdG8gYXNzb2NpYXRlIGEgZGlmZmVyZW50IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBiYXNl
ZCBvbgogICAgIGRldmljZSBwcm92aWRlZCBwcm9jZXNzIGlkZW50aWZpY2F0aW9uIG51bWJlci4K
ICAgLSBNU0kgcGFnZSB0YWJsZSBjb25maWd1cmF0aW9uIHVzZWQgdG8gZGlyZWN0IGFuIE1TSSB0
byBhIGd1ZXN0IGludGVycnVwdCBmaWxlCiAgICAgaW4gYW4gSU1TSUMuIFRoZSBNU0kgcGFnZSB0
YWJsZSBmb3JtYXRzIGFyZSBkZWZpbmVkIGJ5IHRoZSBBZHZhbmNlZCBJbnRlcnJ1cHQKICAgICBB
cmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbiBbMl0uCgpUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIGNv
bXBsZXRlIHNpbmdsZS1sZXZlbCB0cmFuc2xhdGlvbiBzdXBwb3J0LCBpbmNsdWRpbmcgc2hhcmVk
CnZpcnR1YWwgYWRkcmVzcyAoU1ZBKSwgQVRTL1BSSSBpbnRlcmZhY2VzIGluIHRoZSBrZXJuZWwg
ZHJpdmVyLiBQYXRjaGVzIGFkZGluZyBNU0kKaWRlbnRpdHkgcmVtYXBwaW5nIGFuZCBHLVN0YWdl
IHRyYW5zbGF0aW9uIChHUEEgdG8gU1BBKSBhcmUgYWRkZWQgb25seSB0byBleGNlcmNpc2UKaGFy
ZHdhcmUgaW50ZXJmYWNlcywgdG8gYmUgY29tcGxlbWVudGVkIHdpdGggQUlBL0tWTSBiaW5kaW5n
cyBpbiBmb2xsb3ctdXAgc2VyaWVzLgoKVGhpcyBzZXJpZXMgaXMgYSBsb2dpY2FsIHJlZ3JvdXBp
bmcgb2Ygc2VyaWVzIG9mIGluY3JlbWVudGFsIHBhdGNoZXMgYmFzZWQgb24KUklTQy1WIEludGVy
bmF0aW9uYWwgSU9NTVUgVGFzayBHcm91cCBkaXNjdXNzaW9ucyBhbmQgc3BlY2lmaWNhdGlvbiBk
ZXZlbG9wbWVudApwcm9jZXNzLiBPcmlnaW5hbCBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0IHRoZSBt
YWludGFpbmVyJ3MgcmVwb3NpdG9yeSBicmFuY2ggWzNdLgoKVGhlc2UgcGF0Y2hlcyBjYW4gYWxz
byBiZSBmb3VuZCBpbiB0aGUgcmlzY3ZfaW9tbXVfdjEgYnJhbmNoIGF0OgpodHRwczovL2dpdGh1
Yi5jb20vdGplem5hY2gvbGludXgvdHJlZS9yaXNjdl9pb21tdV92MQoKVG8gdGVzdCB0aGlzIHNl
cmllcywgdXNlIFFFTVUvT3BlblNCSSB3aXRoIFJJU0MtViBJT01NVSBpbXBsZW1lbnRhdGlvbiBh
dmFpbGFibGUgaW4KdGhlIHJpc2N2X2lvbW11X3YxIGJyYW5jaCBhdDoKaHR0cHM6Ly9naXRodWIu
Y29tL3RqZXpuYWNoL3FlbXUvdHJlZS9yaXNjdl9pb21tdV92MQoKUmVmZXJlbmNlczoKWzFdIC0g
aHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNwbGF5L0hPTUUvU3BlY2lmaWNhdGlvbitTdGF0dXMK
WzJdIC0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFpYS9yZWxlYXNlcy9kb3dubG9h
ZC8xLjAvcmlzY3YtaW50ZXJydXB0cy0xLjAucGRmClszXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS90
amV6bmFjaC9xZW11L3RyZWUvdGplem5hY2gvcmlzY3YtaW9tbXUtMjAyMzA3MTkKCgpBbnVwIFBh
dGVsICgxKToKICBkdC1iaW5kaW5nczogQWRkIFJJU0MtViBJT01NVSBiaW5kaW5ncwoKVG9tYXN6
IEplem5hY2ggKDEwKToKICBSSVNDLVY6IGRyaXZlcnMvaW9tbXU6IEFkZCBSSVNDLVYgSU9NTVUg
LSBaaW9tbXUgc3VwcG9ydC4KICBSSVNDLVY6IGFyY2gvcmlzY3YvY29uZmlnOiBlbmFibGUgUklT
Qy1WIElPTU1VIHN1cHBvcnQKICBNQUlOVEFJTkVSUzogQWRkIG15c2VsZiBmb3IgUklTQy1WIElP
TU1VIGRyaXZlcgogIFJJU0MtVjogZHJpdmVycy9pb21tdS9yaXNjdjogQWRkIHN5c2ZzIGludGVy
ZmFjZQogIFJJU0MtVjogZHJpdmVycy9pb21tdS9yaXNjdjogQWRkIGNvbW1hbmQsIGZhdWx0LCBw
YWdlLXJlcSBxdWV1ZXMKICBSSVNDLVY6IGRyaXZlcnMvaW9tbXUvcmlzY3Y6IEFkZCBkZXZpY2Ug
Y29udGV4dCBzdXBwb3J0CiAgUklTQy1WOiBkcml2ZXJzL2lvbW11L3Jpc2N2OiBBZGQgcGFnZSB0
YWJsZSBzdXBwb3J0CiAgUklTQy1WOiBkcml2ZXJzL2lvbW11L3Jpc2N2OiBBZGQgU1ZBIHdpdGgg
UEFTSUQvQVRTL1BSSSBzdXBwb3J0LgogIFJJU0MtVjogZHJpdmVycy9pb21tdS9yaXNjdjogQWRk
IE1TSSBpZGVudGl0eSByZW1hcHBpbmcKICBSSVNDLVY6IGRyaXZlcnMvaW9tbXUvcmlzY3Y6IEFk
ZCBHLVN0YWdlIHRyYW5zbGF0aW9uIHN1cHBvcnQKCiAuLi4vYmluZGluZ3MvaW9tbXUvcmlzY3Ys
aW9tbXUueWFtbCAgICAgICAgICAgfCAgMTQ2ICsrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGFyY2gvcmlzY3YvY29uZmlncy9kZWZjb25m
aWcgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVycy9pb21tdS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJzL2lvbW11L01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUuYyAg
ICAgICAgICAgICAgICAgICAgfCAgICAzICsKIGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICB8ICAgMjIgKwogZHJpdmVycy9pb21tdS9yaXNjdi9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvX3BndGFibGUu
YyAgICAgICAgICAgICAgfCAgMjY2ICsrCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMu
aCAgICAgICAgICAgICAgfCAgNzA0ICsrKysrKwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1w
Y2kuYyAgICAgICAgICAgICAgIHwgIDIwNiArKwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1w
bGF0Zm9ybS5jICAgICAgICAgIHwgIDE2MCArKwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1z
eXNmcy5jICAgICAgICAgICAgIHwgIDE4MyArKwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5j
ICAgICAgICAgICAgICAgICAgIHwgMjEzMCArKysrKysrKysrKysrKysrKwogZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS5oICAgICAgICAgICAgICAgICAgIHwgIDE2NSArKwogaW5jbHVkZS9saW51
eC9pby1wZ3RhYmxlLmggICAgICAgICAgICAgICAgICAgIHwgICAgMiArCiAxNiBmaWxlcyBjaGFu
Z2VkLCAzOTk4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvcmlzY3YsaW9tbXUueWFt
bAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvS2NvbmZpZwogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvX3BndGFibGUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtYml0cy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aW9tbXUvcmlzY3YvaW9tbXUtc3lzZnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUuaAoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK

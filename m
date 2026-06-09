Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDBBCDE015
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 21:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9a54P5PEmENJtG3zSPb4FybqfIxwwEnN0/T/NWogdw0=; b=JpVV7FTnKl61m5
	0cRidzDBrnZr44Za0Zv8fB3E9KbbuqH3qxG4++sQmIhJqkpi8YiQjd32jgsP1yU4uqfQ2J9uWbfIW
	ZoJY1wMcRzE59fUNSegVLYir+mMt5tVg0BodUTLq7wAcFBImqCXkpXxRflvk6QSvo03qYhsBiHoOX
	E2Nk1xt916YpCQu4YR2S0gRK3JpA6afD9f7wQxPmOqzv7uuYENTPWH3jKBseApW//5Ysq2YK8KFV3
	Vrf+ECPILHMO+D5XtRQP61h7yzQPSNXUCEVKpP7fOAfgBKv7/UHVmOLzFLp0XVF7LmhUZOGpNesaI
	4U9q5DDNRJaVx1H/pjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcrGw-00000009q3w-2W8E;
	Thu, 25 Jun 2026 21:06:06 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWktn-00000004a2X-2stg
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 01:05:07 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gZ9g05Yp6z52SGY;
	Tue, 09 Jun 2026 09:04:44 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 65914iMY081171;
	Tue, 9 Jun 2026 09:04:44 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid12;
	Tue, 9 Jun 2026 09:04:45 +0800 (CST)
X-Zmail-TransId: 2b076a2766ad011-e86b8
X-Mailer: Zmail v1.0
Message-ID: <20260609090445085Jd6HCOSNMYKdW-T-Gzdzj@zte.com.cn>
In-Reply-To: <CAB19ukFMu1tW5QkCOY2e=DWbKrehEDv_iO5T7vEfKEGkbTFEEw@mail.gmail.com>
References: CAB19ukEzQZktJcBAXi8X2Pwz+hO_FcR+iiaK9nsCAumP9BrHnw@mail.gmail.com,20260608142206426CGB5DlYd1xVlR8wrOawWH@zte.com.cn,CAB19ukFMu1tW5QkCOY2e=DWbKrehEDv_iO5T7vEfKEGkbTFEEw@mail.gmail.com
Date: Tue, 9 Jun 2026 09:04:45 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <sunilvl@oss.qualcomm.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gaW9tbXUvcmlzY3Y6IEFkZCBkZXBlbmRlbmN5IGJldHdlZW4gaW9tbXUgYW5kIGRldmljZXM=?=
X-MAIL: mse-fl1.zte.com.cn 65914iMY081171
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 09 Jun 2026 09:04:44 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A2766AC.001/4gZ9g05Yp6z52SGY
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_180459_947703_AF2B072B 
X-CRM114-Status: GOOD (  15.74  )
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:06:04 -0700
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
Cc: aou@eecs.berkeley.edu, tomasz.jeznach@linux.dev, alex@ghiti.fr, rafael@kernel.org, anup.patel@oss.qualcomm.com, linux-kernel@vger.kernel.org, andrew.jones@oss.qualcomm.com, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, linux-riscv@lists.infradead.org, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBPbiBNb24sIEp1biA4LCAyMDI2IGF0IDExOjUy4oCvQU0gPHdhbmcueWVjaGFvMjU1QHp0ZS5j
b20uY24+IHdyb3RlOgo+ID4KPiA+ID4gPgo+ID4gPiA+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5n
LnllY2hhbzI1NUB6dGUuY29tLmNuPgo+ID4gPiA+Cj4gPiA+ID4gQ29tbWl0IDkxNTY1ODUyODBm
MSAoIkFDUEk6IFJJTVQ6IEFkZCBkZXBlbmRlbmN5IGJldHdlZW4gaW9tbXUgYW5kCj4gPiA+ID4g
ZGV2aWNlcyIpIGFkZHMgdGhlIGRlcGVuZGVuY3kgYmV0d2VlbiBpb21tdSBhbmQgZGV2aWNlcyBv
biBBQ1BJCj4gPiA+ID4gc3lzdGVtcy4gT24gZGV2aWNldHJlZSBzeXN0ZW1zLCB0aGUgaW5jb3Jy
ZWN0IHJlbW92YWwgb3JkZXIgYWxzbwo+ID4gPiA+IG9jY3Vycy4KPiA+ID4gPgo+ID4gPiBJbnRl
cmVzdGluZy4gV2h5IGlzIGl0IG5vdCBoYW5kbGVkIGJ5IHRoZSBmd19kZXZsaW5rIGluZnJhc3Ry
dWN0dXJlIGluIERUPwo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IFN1bmlsCj4gPgo+ID4gVGhh
bmsgeW91LiBJIGhhdmUgbm90aWNlZCB0aGF0IGNvbW1pdCBlMTQ5NTczYjJmODQgKCJvZjogcHJv
cGVydHk6IEFkZCBkZXZpY2UKPiA+IGxpbmsgc3VwcG9ydCBmb3IgImlvbW11LW1hcCIiKSBhZGRz
IHN1cHBvcnQgZm9yICJpb21tdS1tYXAiIHRvIHRoZSBkZXZpY2UgbGluawo+ID4gc3VwcGxpZXIg
YmluZGluZ3MsIHNvIHRoYXQgcHJvYmluZyBvZiBQQ0kgZGV2aWNlcyBjYW4gYmUgZGVmZXJyZWQg
dW50aWwgYWZ0ZXIKPiA+IHRoZSBJT01NVSBpcyBhdmFpbGFibGUuCj4gPgo+ID4gVGhlIFFFTVUg
UklTQy1WIHZpcnQgbWFjaGluZSBjdXJyZW50bHkgbGFja3MgdGhlICJpb21tdS1tYXAiIHByb3Bl
cnR5IGZvciB0aGUKPiA+IFBDSWUgYnVzIHdoZW4gdGhlIGlvbW11LXBjaSBkZXZpY2UgaXMgdXNl
ZCwgd2hpY2ggbGVhZHMgdG8gdGhpcyBpc3N1ZS4gVGhlcmVmb3JlLAo+ID4gSSBiZWxpZXZlIHRo
ZSBjb3JyZWN0IGZpeCBpcyB0byBhZGQgdGhlICJpb21tdS1tYXAiIHByb3BlcnR5IGZvciBQQ0ll
IGluIFFFTVUuCj4gPgo+IEZvciBQQ0kgSU9NTVUsIHRoZSBkZXBlbmRlbmN5IHNob3VsZCBiZSBh
dXRvbWF0aWNhbGx5IHRha2VuIGNhcmUgc2luY2UgaW9tbXUKPiBzaG91bGQgYWx3YXlzIGJlIHRo
ZSBmaXJzdCBkZXZpY2UgaW4gdGhlIGhpZXJhcmNoeSBhbmQgc2Nhbm5lZCBmaXJzdC4KClRoYW5r
IHlvdSBmb3IgcG9pbnRpbmcgaXQgb3V0LiBUaGUgZGV2aWNlIGlzIG5vdCByZW1vdmVkIGJlZm9y
ZSB0aGUgUENJIElPTU1VCmRldmljZSBiZWNhdXNlIHRoZSBCREYgb2YgdGhlIGRldmljZSBJIGNv
bmZpZ3VyZWQgaXMgc21hbGxlciB0aGFuIHRoZSBCREYgb2YKdGhlIFBDSSBJT01NVSBkZXZpY2Uu
CgpSZWdhcmRzLApZZWNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK

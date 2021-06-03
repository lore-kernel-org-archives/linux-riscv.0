Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27C8C47096
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 04:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670AC613D7
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 04:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670AC613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:
	Subject:To:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=q9OpXVu22Fq1DnwogPPXfWkoBEJDBLZL+/F1ct5YONc=; b=uRrq0jPFq5DH06
	lIQBcB2E3qVLe9rvYGPoefxy8owNrTOoq79kAktAJhy4oHUE2s8zp331OZAiG4v5yDgatJgHUugqd
	62d0ZA0ylUgy5U9RPiz6k6IPzCXlarLDW+WQIzY13jinfnqkEtxGeFHmr7wgQIp0NBce7Jhre+bFX
	GBzNDJTg+aEWjeI+ZV/1UHDaxDc+Kyls5I/Ry+Ayyfaj6ASGIWZiPL9y/iZYqltzGYT1IjgqwCcpU
	7X243tvglq5d5dBi19A26bFriuoBVY7+hqig57ga9WzYDOts+3AxEBTM6KtGSTq4JQ/re/QoYC54z
	HSX1t8uF6W699AVsl/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lofJE-0076gh-1G; Thu, 03 Jun 2021 04:50:20 +0000
Received: from mail-m17641.qiye.163.com ([59.111.176.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lofJA-0076fd-9t
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 04:50:18 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17641.qiye.163.com (Hmail) with ESMTP id C5B696012C;
 Thu,  3 Jun 2021 12:50:12 +0800 (CST)
Message-ID: <ACYAbADLDo5nvv4af7zOLqqA.3.1622695812793.Hmail.wanjiabing@vivo.com>
To: Alex Shi <seakeel@gmail.com>, Alex Shi <alexs@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Wu XiangCheng <bobwxc@email.cn>, Fangrui Song <maskray@google.com>, 
 Bernard Zhao <bernard@vivo.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 clang-built-linux@googlegroups.com
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gW3YyXSBkb2NzL3poX0NOOiBhZGQgdHJhbnNsYXRpb25zIGluIHpoX0NOL2Rldi10b29scy9rYXNhbg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.158
In-Reply-To: <69008e54-003a-eeb5-75f8-96e03f37d2df@gmail.com>
MIME-Version: 1.0
Received: from wanjiabing@vivo.com( [58.213.83.158) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 3 Jun 2021 12:50:12 +0800 (GMT+08:00)
From: Jiabing Wan <wanjiabing@vivo.com>
Date: Thu, 3 Jun 2021 12:50:12 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQh1IHlYYSE9PHRlKTRlPTRhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1PS0lLTkJJT01MN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6OCI6GTo*Nz8UThUNDU8aHUwBNDcKCjpVSFVKTUlJTUJOQ0pISUlDVTMWGhIXVQwaFRESGhkS
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJSkhVQ0hVSk5DWVdZCAFZQU9DTkw3Bg++
X-HM-Tid: 0a79d0351ed6d997kuwsc5b696012c
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_215016_539772_8A447E21 
X-CRM114-Status: UNSURE (   8.13  )
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

IAo+IFJlOiBbUEFUQ0hdIFt2Ml0gZG9jcy96aF9DTjogYWRkIHRyYW5zbGF0aW9ucyBpbiB6aF9D
Ti9kZXYtdG9vbHMva2FzYW4+PkhpIEppYWJpbmcsCj4KPlRoYW5rcyBmb3IgdHJhbnNsYXRpb24h
IFRoZSBjb250ZW50cyBhcmUgZ2VuZXJhbGx5IGZpbmUuIAo+SSB0cmllZCB0aGUgcGF0Y2ggd2l0
aCBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgZm91bmQgdGhlcmUgYXJlIGxvdHMgZXJyb3JzCgpIaSxB
bGV4LAoKT2gsIHRoYXQgaXMgc3RyYW5nZS4KCkluIG15IHVidW50dSBzZXJ2ZXIsIEkgcmFuIHNj
cmlwdHMvY2hlY2twYXRjaC5wbCBhbmQgZ290OgoKV2hlbiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9kZXYtdG9vbHMva2FzYW4ucnN0CiJ0b3RhbDogMCBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDQzMSBsaW5lcyBjaGVja2VkIgoKV2hlbiAwMDAxLXYyLWRvY3MtemhfQ04tYWRkLXRyYW5z
bGF0aW9ucy1pbi16aF9DTi1kZXYtdG9vbHMta2EucGF0Y2guCiJXQVJOSU5HOiBhZGRlZCwgbW92
ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiM0
MTogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNDQ1
IGxpbmVzIGNoZWNrZWQiCgpObyBlcnJvcnMgYW5kIGp1c3Qgb25lIHdhcm5pbmcuClNvIEkgdGhp
bmsgdGhlcmUgd2FzIGEgcHJvYmxlbSB3aXRoIHlvdXIgcGxhdGZvcm0gb3IgZG93bmxvYWRpbmc/
CgpJZiB0aGVyZSB3ZXJlIG5vIHByb2JsZW0sIEkgd291bGQgY2hlY2sgbXkgZW1haWwgY2xpZW50
IGFnYWluIDspCgo+LS0tCj4uLi4KPkVSUk9SOiBET1MgbGluZSBlbmRpbmdzCj4jNTUyOiBGSUxF
OiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXYtdG9vbHMva2FzYW4ucnN0OjQz
MDoKPiteTSQKPgo+RVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKPiM1NTM6IEZJTEU6IERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10b29scy9rYXNhbi5yc3Q6NDMxOgo+Ky4u
IF9LVW5pdDogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvZGV2LXRvb2xz
L2t1bml0L2luZGV4Lmh0bWxeTSQKPgo+dG90YWw6IDQzMiBlcnJvcnMsIDEgd2FybmluZ3MsIDQ0
NSBsaW5lcyBjaGVja2VkCj4tLS0KPgo+YW5kIHRoZSBsaW5lcyBpbiB0aGUgcGF0Y2ggYXJlIG5v
dCBhbGlnbmVkIG9uIDgwIGNoYXJzLCAoNDAgY2hhcnMgZm9yIENoaW5lc2UsCj5zaW5jZSBvbmUg
Q2hpbmVzZSBjaGFyIGNvdWxkIHRha2UgMiBwb3NpdGlvbnMuICkKPlRoYW5rcwo+QWxleAoKT0ss
IGdyZWF0IHRpcHMgZm9yIG1lLgpJJ2xsIGZpeCB0aGVtIGluIHYzLgoKVGhhbmtzLApKaWFiaW5n
Cgo+Cj5PbiAyMDIxLzYvMiDkuIvljYg4OjU2LCBXYW4gSmlhYmluZyB3cm90ZToKPj4gQWRkIG5l
dyB6aCB0cmFuc2xhdGlvbnMKPj4gKiB6aF9DTi9kZXYtdG9vbHMva2FzYW4ucnN0Cj4+IGFuZCBs
aW5rIGl0IHRvIHpoX0NOL2Rldi10b29scy9pbmRleC5yc3QKPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IFdhbiBKaWFiaW5nIDx3YW5qaWFiaW5nQHZpdm8uY29tPgo+PiAtLS0KPj4gQ2hhbmdlbG9nOgo+
PiB2MjoKPj4gLSBEZWxldGUgc3BhY2VzIHN1cnJvdW5kIHdpdGggRW5nbGlzaCB3b3Jkcy4KPj4g
LS0tDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

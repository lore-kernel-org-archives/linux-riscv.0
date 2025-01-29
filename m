Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCEBC02190
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wh60nC3eivldSkMc0gWMhN9UgN8okIIAub76L7QCQAs=; b=oX3xmKXFzoBUI1
	qQdgfPrHXDne1IYQnA6F6SMJf2tKVGLMWoqW8BdbllJXSeaOzab4iSa5AVR1OHVY0ltqDSEFDz+Zs
	k96nz6FbKQ3RqTCQV+LGTmjHHF8VVXO5bK/RmtObHWYQANIK5C38RNxoCkuLVWXtPn3UDYbz4iHHX
	0z7lsGTDnwVGZuNtWIgCLAU9E0xGzQ/vkMxLuMv81rSb77eIp6UTgoxhtXLK1yKovUD6N2m8am1vr
	mbTxbU4cuFZ7xizsxg8qqd22eIYwxxibW+KH9oaCxcbgzWDxeT64g5/Ix0PD8Yay0xhz1KUWuiT8o
	tXEYaZSs7LPpn3mrBzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td860-000000070qJ-1ydX;
	Wed, 29 Jan 2025 13:27:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td85x-000000070pG-1K3X
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 13:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48E81A41997
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 13:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE660C4CEE7
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738157223;
	bh=Mfa12/3dagFXIQxteRwucVkVBHF3oQe15nLtcgIC8A8=;
	h=From:Date:Subject:To:Cc:From;
	b=khVPXUQUlfZnMM6lWe4W8g38X7Hyh2LanI5TyAuf0mIlM5cVfTqnniwyifmR0Y57G
	 b3WD9C/BSm2tGOxWlg3O+bUEHdS18uCdy7kjXwo2MW61RnKD1nMTP6UUwg1vgwjmLD
	 bLbvV7rIGYtrMiDb4JNVQjErFUTCyi+1Ba8bWW1859DpribNfLLVlAiucDi35OQblr
	 BcSd9VUu7YfR6jDSedFJaU4pDwE+nRHeV6nr48culReg3C8WNOzdn8nRGj4sYZ/TsG
	 LoIndqsjMETzVbpSIq7FhYRT0EfRvTP7skvynLjfT7qCOMhQ63aY1NgMLT/1k+y4Bo
	 JD9rvXrXcYY6w==
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4679eacf25cso39871631cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 05:27:03 -0800 (PST)
X-Gm-Message-State: AOJu0Yzn4PUhnengaDVtcGsuZHiURJzs6Tb2YeX8EsbMcvBVcUBUnWLM
	UK7dKPTrXWNxZETw2PqxeV/3QhJ+pjcCqFxnRnbP1Qij0fsF5L8eR8VB3i4NUF3w+iGafnmMEVg
	mh9Z5YQf3ZHQk4qG9LTqXvJ9OPME=
X-Google-Smtp-Source: AGHT+IF3V7pM2KPee3yamrKIEOQ80b0zyd5llLfBZYhtv36o50dOFjY/3cn1Hu5CUiMEsdWQuZM16IX1FTiLcwrsJKk=
X-Received: by 2002:a05:6214:3007:b0:6e1:69ba:346 with SMTP id
 6a1803df08f44-6e243bb8251mr53436316d6.10.1738157222765; Wed, 29 Jan 2025
 05:27:02 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 29 Jan 2025 14:26:51 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNj0i_gxiuZFFY=87s+h4GV43u+ORiTi0CHOxe-R3eGrQg@mail.gmail.com>
X-Gm-Features: AWEUYZnw9SGuU_33W5iHB0as5Z81p9h24noU0-XoMxGpZkxFiqwh8rH5CpVCeDw
Message-ID: <CAJ+HfNj0i_gxiuZFFY=87s+h4GV43u+ORiTi0CHOxe-R3eGrQg@mail.gmail.com>
Subject: Linux RISC-V Patchwork CI updates
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <mail@conchuod.ie>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, Tedd An <tedd.an@intel.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, LKML <linux-kernel@vger.kernel.org>, 
	linux-bluetooth@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_052705_487384_D9F3DE67 
X-CRM114-Status: GOOD (  11.75  )
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

SGkhCgpJIGp1c3QgZGVwbG95ZWQgYSBuZXcsIGFuZCBob3BlZnVsbHkgaW1wcm92ZWQsIHZlcnNp
b24gb2YgdGhlIExpbnV4ClJJU0MtViBQYXRjaHdvcmsgQ0kuCgpUaGUgUFcgQ0kgaXMgdGhlIHRo
aW5nIHRoYXQgcG9zdHMgdGhlICJjaGVjayBzdG9wbGlnaHRzIiB0byB0aGUgTGludXgKUklTQy1W
IFBhdGNod29yayBpbnN0YW5jZSBbMV0uIElPVywgYSBwcmUtY29tbWl0IENJLgoKQ2hhbmdlcwot
LS0tLS0tCgoqIFRoZSB0ZXN0IGZyYW1ld29yayBpcyBub3cgdXNpbmcgUHl0aG9uLCBpbnN0ZWFk
IG9mIGEgcGlsZSBvZiBCYXNoLiBBCiAgbG90IG9mIHRoZSBjb2RlIGlzIGhlYXZpbHkgYmFzZWQg
b24gYnpjYWZlIFsyXS4gQmFzaCBvbmx5IHRha2VzIHlvdQogIHRoYXQgZmFyLiA7LSkKCiogRW1h
aWwgc3VwcG9ydDsgVGhlIGZyYW1ld29yayB3aWxsIG1haWwgdGhlIHN1Ym1pdHRlcihzKSB3aXRo
IHRoZSBDSQogIHJlc3VsdHMsIGZvciBiZXR0ZXIgdmlzaWJpbGl0eS4gQ3VycmVudGx5LCBJJ20g
dGhlIG9ubHkgcmVjaXBpZW50IG9mCiAgbWFpbHMgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGZyYW1l
d29yayBkb2Vzbid0IHNwYW0gdG9vIG11Y2guIEknbGwKICBmbGlwIHRoZSBzd2l0Y2ggc29tZXRp
bWUgdGhpcyB3ZWVrLgoKKiBGYWlsZWQgdGVzdHMgd2lsbCBoYXZlIHRoZSBkZXRhaWxzIGluIGEg
R2l0aHViIEdpc3QgcGFnZSwgbGlua2VkCiAgZnJvbSB0aGUgUGF0Y2h3b3JrIHBhdGNoIHZpZXcu
CgoqIFRoZSBmcmFtZXdvcmsgd2lsbCBwb3N0IHVwZGF0ZXMvcmVzdWx0cyBhcyBjb21tZW50cyB0
byB0aGUgcHVsbAogIHJlcXVlc3QgY29ycmVzcG9uZGluZyB0byB0aGUgUGF0Y2h3b3JrIHNlcmll
cywgZS5nLiBbM10uIFRoaXMgaXMgaW4KICBhZGRpdGlvbiB0byB0aGUgR2lzdCBsaW5rcyBhYm92
ZS4KCiogTW92ZWQgZnJvbSBNZXRhJ3MgS0RQIGRhZW1vbiAoZXh0ZXJuYWwgUHl0aG9uIGRhZW1v
biB0aGF0CiAgc3luY2hyb25pemVzIHRoZSBtYWlsaW5nIGxpc3Qgd2l0aCBHaXRodWIpLCBpbiBm
YXZvciBvZiB0aGUKICBCbHVldG9vdGggZm9sa3MgYnpjYWZlIHNjcmlwdHMgWzJdLiBUaGlzIGNo
YW5nZSBtYWtlcyB0aGUgd2hvbGUgUFcgQ0kKICBzZWxmLWNvbnRhaW5lZCBhcyBhIHNldCBvZiBH
aXRodWIgQWN0aW9uIHNldCBvZiBmaWxlcywgYW5kIGhvcGVmdWxseQogIG9wZW4gdXAgZm9yIG90
aGVyIGZvbGtzIHRvIGhhY2sgdGhlIENJIChudWRnZSwgbnVkZ2UpLgoKRGV0YWlscyAoZm9yIHRo
b3NlIHdobyBjYXJlLCBvciB3b3VsZCBsaWtlIHRvIHB1c2ggUFJzKQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpUaGUgQ0kgY29kZSByZXNp
ZGVzIGluIGxpbnV4LXJpc2N2L2dpdGh1Yi1jaSBbNF0uIEFkZGl0aW9ucyB0byB0aGlzCnJlcG8g
d2lsbCBhdXRvbWF0aWNhbGx5IGJlIHBpY2tlZCB1cCB0aGUgbGludXgtcmlzY3YvbGludXggWzVd
IHdoZXJlCnRoZSBDSSBpcyBydW4uCgpDdXJyZW50bHksIHRoZXJlIGFyZSA2IGJyYW5jaGVzOgog
IG1hc3Rlciwgd29ya2Zsb3cKICB7bWFzdGVyLHdvcmtmbG93fV9fcmlzY3ZfX2ZpeGVzCiAge21h
c3Rlcix3b3JrZmxvd31fX3Jpc2N2X19mb3ItbmV4dAoKbWFzdGVyIGlzIGEgbWlycm9yIG9mIExp
bnVzJyBtYXN0ZXIgWzZdLCBhbmQgZml4ZXMvZm9yLW5leHQgaXMgdGhlClJJU0MtViB0cmVlIFs3
XS4gVGhlICJ3b3JrZmxvdyIgaXMgdGhlIG1hc3RlciwgYnV0IHdpdGggdGhlIFBXIENJIFs0XQph
cHBsaWVkIGFzIG9uZSBjb21taXQgb24gdG9wLgoKVGhlIGJyYW5jaGVzIGFib3ZlIGFyZSBzeW5j
aGVkIGJ5IGEgR2l0aHViIGNyb25qb2IsIHJ1biBieSBzeW5jLnltbApbOF0uIFRoZSBzeW5jLnlt
bCBhY3Rpb24gc3luY2hyb25pemVzIGFsbCB0aGUgYnJhbmNoZXMsIGFuZCB0aGVuCmZldGNoZXMg
dGhlIGxhdGVzdCAiTmV3IiBwYXRjaGVzIGZyb20gUGF0Y2h3b3JrIGluIHRoZSBsYXN0IDcgZGF5
cy4KClRoZSBzY3JpcHQgdGhlbiB0cmllcyB0byBhcHBseSB0aGUgc2VyaWVzIGluIHRoZSBmb2xs
b3dpbmcgb3JkZXI6CiAgMS4gd29ya2Zsb3dfX3Jpc2N2X19maXhlcwogIDIuIHdvcmtmbG93X19y
aXNjdl9fZm9yLW5leHQKICAzLiB3b3JrZmxvdwoKSWYgYWxsIHRocmVlIGZhaWwsIHRoZSBzdWJt
aXR0ZXIgd2lsbCBiZSBub3RpZmllZC4gSWYgYW55IG9mIHRoZW0Kc3VjY2VlZHMsIGEgR2l0aHVi
IFBSIGlzIGNyZWF0ZWQgZm9yIHRoZSBzZXJpZXMuIElPVywgYWxsIHRoZSBvbmdvaW5nCnRlc3Rz
IGZvciBwYXRjaGVzIGNhbiBiZSBmb3VuZCBoZXJlIFs5XS4KClRoZSB0ZXN0IGZvciBhIHNlcmll
cyB3aWxsIGJlIHJ1biBpbiB0aGUgY29udGV4dCBvZiBhIFBSLCBhbmQgYWxsCmluZm9ybWF0aW9u
IGNhbiBiZSBmb3VuZCB0aGVyZS4gVGhlIGNvZGUgZm9yIHRoZSBQYXRjaHdvcmsgdGVzdHMgY2Fu
IGJlCmZvbGxvd2VkIGZyb20gdGhlIHdvcmtmbG93IFsxMF0uCgpSSVNFIGlzIGNvbnRpbnVpbmcg
dG8gc3BvbnNvciB0aGUgc2VsZiBob3N0ZWQgR2l0aHViIFJ1bm5lcnMsIGFuZCBzb29uCndlJ2xs
IG1vdmUgZnJvbSA0IHRvIDggaW5zdGFuY2VzLCB3aGljaCB3aWxsIGFsbG93IGZvciBtb3JlIHRl
c3RzLgoKCkNoZWVycywKQmrDtnJuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJpc2N2L2xpc3QvClsyXSBodHRwczovL2dpdGh1Yi5jb20vdGVkZC1hbi9i
emNhZmUKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC9wdWxsLzIKWzRd
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9naXRodWItY2kvCls1XSBodHRwczovL2dp
dGh1Yi5jb20vbGludXgtcmlzY3YvbGludXgvCls2XSBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0Cls3XSBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0Cls4XSBodHRw
czovL2dpdGh1Yi5jb20vbGludXgtcmlzY3YvZ2l0aHViLWNpL2Jsb2IvbWFpbi8uZ2l0aHViL3dv
cmtmbG93cy9zeW5jLnltbApbOV0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4
L3B1bGxzClsxMF0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2dpdGh1Yi1jaS9ibG9i
L21haW4vLmdpdGh1Yi93b3JrZmxvd3MvcGF0Y2h3b3JrLnltbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

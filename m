Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA873CA5FA4
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdtax9AxClxd1VZUxEWcyqiR6CgVYuxEy9+mO5OlCLA=; b=IOhJMZyByECrI1
	Yovm+ShVSckAUDgWOcW+LlXz58dGuj9JLeVTdy1hxt4A2GH40HhUjYLnE4HX7yojWs7ma7kO8FTLh
	Y8vUf3Z+mdj7fsU9LFH3cb796H8gIJUmhwdM9NR2O097PjCQWw7drT8yEPmBMXNKSJ/kKeLC+RnA4
	6DrYq9oGB+Evf5w/1jEdY7I+YugFAkhu0LIQVFdMV6DCvBtKkgeYqvMsi7Nq5YnYhFDsCjfOYxc+a
	1yc9KpIf88KEPu0Fzerne9tFZBDRHUaRwEKGtNnItbCoBccfwo3KiZexUduVLspGe/nXAtYptdz9m
	DLh9F1NZmV8kGZJbmjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5df-0000000HWif-4Br0;
	Mon, 28 Sep 2026 07:19:04 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5dd-0000000HWgj-1kYl
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 07:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790579939; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=sc03rBU1KC3f+hwPJ9gDyEIPoJ5n74UzjR2h9IbzYgg=;
	b=voQQSFjuxXohYt7kkr+fLbonhuyyJvOOAHrXTZx8Ua/r/KAG5jgbfwmjyaIdm9R/FCG9Ovkbn8jh31lPZ8n88FVk5iYq++jKt2f3YBqR5KPdCzAJggbYPp0nbU1r17QeIbepy0SWt88rdP41jRvb1dHFXakB2+taO9fTJtur5OQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBjcVOx_1790579933;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBjcVOx_1790579933 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 15:18:56 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 2/4] selftests/bpf: Enable gotox tests for riscv64
Date: Mon, 28 Sep 2026 15:18:43 +0800
Message-ID: <20260928071845.2432-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928071845.2432-1-cp0613@linux.alibaba.com>
References: <20260928071845.2432-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_001901_671701_0A394FE5 
X-CRM114-Status: UNSURE (   7.30  )
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

VGhlIHJpc2N2NjQgSklUIG5vdyBzdXBwb3J0cyB0aGUgZ290b3ggaW5zdHJ1Y3Rpb24gYW5kIGp1
bXAgdGFibGVzLCBzbwpydW4gdGhlIHRlc3RzIGluIHZlcmlmaWVyX2dvdG94LmMgb24gcmlzY3Y2
NCB0b28sIG1pcnJvcmluZyB3aGF0IHdhcyBkb25lCmZvciBhcm02NCBhbmQgcG93ZXJwYy4KClRo
ZSBndWFyZCBpcyA2NC1iaXQgb25seSBiZWNhdXNlIHRoZSBSVjMyIEpJVCBkb2VzIG5vdCBpbXBs
ZW1lbnQgZ290b3guCgpTaWduZWQtb2ZmLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJh
YmEuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNr
ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBzaW5j
ZSB2MjoKLSBVbmNoYW5nZWQuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIENvbGxhcHNlIHRoZSBtdWx0
aS1saW5lICNlbmRpZiBtYXJrZXIgdG8gYSBzaW5nbGUgbGluZS4KCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfZ290b3guYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9nb3RveC5jIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2dvdG94LmMKaW5kZXggZjVhOTg3OGM3
YjhkLi45NmE5ZDkxNDkzMGUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9wcm9ncy92ZXJpZmllcl9nb3RveC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9wcm9ncy92ZXJpZmllcl9nb3RveC5jCkBAIC02LDcgKzYsOSBAQAogI2luY2x1ZGUgImJwZl9t
aXNjLmgiCiAjaW5jbHVkZSAiLi4vLi4vLi4vaW5jbHVkZS9saW51eC9maWx0ZXIuaCIKIAotI2lm
IGRlZmluZWQoX19UQVJHRVRfQVJDSF94ODYpIHx8IGRlZmluZWQoX19UQVJHRVRfQVJDSF9hcm02
NCkgfHwgZGVmaW5lZChfX1RBUkdFVF9BUkNIX3Bvd2VycGMpCisjaWYgZGVmaW5lZChfX1RBUkdF
VF9BUkNIX3g4NikgfHwgZGVmaW5lZChfX1RBUkdFVF9BUkNIX2FybTY0KSB8fCBcCisJZGVmaW5l
ZChfX1RBUkdFVF9BUkNIX3Bvd2VycGMpIHx8IFwKKwkoZGVmaW5lZChfX1RBUkdFVF9BUkNIX3Jp
c2N2KSAmJiBfX3Jpc2N2X3hsZW4gPT0gNjQpCiAKICNkZWZpbmUgREVGSU5FX1NJTVBMRV9KVU1Q
X1RBQkxFX1BST0coTkFNRSwgU1JDX1JFRywgT0ZGLCBJTU0sIE9VVENPTUUpCVwKIAkJCQkJCQkJ
CVwKQEAgLTU4MCw2ICs1ODIsNiBAQCBub3BfJT06CQkJCQkJCQlcCiAJOiBfX2Nsb2JiZXJfYWxs
KTsKIH0KIAotI2VuZGlmIC8qIF9fVEFSR0VUX0FSQ0hfeDg2IHx8IF9fVEFSR0VUX0FSQ0hfYXJt
NjQgfHwgX19UQVJHRVRfQVJDSF9wb3dlcnBjKi8KKyNlbmRpZiAvKiBnb3RveDogeDg2LCBhcm02
NCwgcG93ZXJwYywgcmlzY3Y2NCAqLwogCiBjaGFyIF9saWNlbnNlW10gU0VDKCJsaWNlbnNlIikg
PSAiR1BMIjsKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK

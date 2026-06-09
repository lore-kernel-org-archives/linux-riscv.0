Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBD0CD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi87H0YN2tl9IWhUU/8ocPm7EK0ITAo1+XEGuZLDrms=; b=s+jOoVZC8TgWoq
	chroNVQapgyliSylRAsJT581vgEDeVG0nRoQiqcGDDEC2bsK/TPox20R768XwFAEJ2wcCrp9ONXZ+
	ZCm1qA7TDg7rqtBEFfs6/nkDVZnAQ9f8qoa8H7AgfwqXeWwYhuvmwLB2JNN6xcPKZGCyT1HM1TbIw
	+nU4SxoNhPoK8YVqNtMwUyEoQXDgmMNbYeph/QEh03eUPL7RL0udTN4NSDW/qrPikfslRVoBTDpei
	lR9HJFGhGuj/RyFrIhGFEv6sq9Qf+oalwP0p+LJBtWgX660lCqYJcev+pH3Gk68wZNHROndBiqVOr
	cm6U0ZVW122a6roHzHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxKk-00000005l2n-0uI9;
	Tue, 09 Jun 2026 14:21:38 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxKh-00000005l1t-31tX
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 14:21:37 +0000
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id C49AD8F3F9;
	Tue,  9 Jun 2026 14:21:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 19B1E20025;
	Tue,  9 Jun 2026 14:21:20 +0000 (UTC)
Date: Tue, 9 Jun 2026 10:21:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Chen Pei <cp0613@linux.alibaba.com>, Andy Chiu
 <andybnac@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, Puranjay Mohan
 <puranjay@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav
 Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 oliver.yang@linux.alibaba.com, zhuo.song@linux.alibaba.com,
 jkchen@linux.alibaba.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 1/8] scripts/sorttable: Handle RISC-V patchable
 ftrace entries
Message-ID: <20260609102120.359f3c4c@fedora>
In-Reply-To: <6753385b-c2ab-4ed0-9400-78ce967450ba@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
	<20260528082310.1994388-2-wanghan@linux.alibaba.com>
	<0a913398-3d0c-472e-89c4-062052eae04d@linux.alibaba.com>
	<20260601095746.70c01d24@fedora>
	<6753385b-c2ab-4ed0-9400-78ce967450ba@linux.alibaba.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: 45xon1xuzxd7bgbg6edxpht5trjjyge4
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 19B1E20025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/HKKn7GymGBUtkbeNr+MEsQdyMhp17MdU=
X-HE-Tag: 1781014880-666201
X-HE-Meta: U2FsdGVkX1+rK/eN1BdojHWIcLwqDes8ikyUSWOVgDM2z/pUIyOFyAee0s6My7Xxv1XzzZB08fnXey3byMofDxmK30CuRFQCjWETw/qIBkjcJV57g+7dTfTdypOfD2pf0hdNCmgUxgCz/J3/gcLcZYfC0zSHjnyQIlGUv9j+Isx5nTYNWn+1B1CJbxTLmg+8dEzmXK9YwAdspV+E77PvKlOsfl9CkgQt5e9eMdCkHTeHy4Zg+CZjBhu/tSKVgIrKau/2+NoIvgk/ss8SC2tb8MP0B6hSQKNl7Zy5c1VIBSaVQ8O0do7KHzUUkMExhc5OsUmLw+L6MoGJv5Tz/LKKkj6b4PH6Qkyj5rBcgmOV845Q9MeB4BlbRCOS2hCWeUjRAg8fESSRucIKnZULyjZjNw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_072135_851595_BFB0A2EC 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 3 Jun 2026 10:10:44 +0800
Shuai Xue <xueshuai@linux.alibaba.com> wrote:

> It's a pure comment cosmetic, not worth a respin on its own. But for the

I don't know. I've respinned for better comments before.

> rest of the feedback on this series (the frame-record metadata contract
> in patch 2 and the dead state->regs field / Call Trace output change in
> patch 6) are the ones actually worth a new version.
> 
> Just to get the routing straight: are you planning to pick this one up
> through the tracing tree on its own?
> 
> It feels like a good candidate for that -- it's an independent
> regression fix (Fixes: 0ca1724b56af) that breaks *all* RISC-V dynamic
> ftrace, not just livepatch, so it shouldn't have to wait on the rest of
> the livepatch series.

As it affects RISCV and I don't have a RISCV to test, I would feel more
comfortable with it going through a RISCV tree that can test the patch.

Feel free to add:

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
